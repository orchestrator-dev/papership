import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';

import '../../../core/error/app_failure.dart';
import '../../../core/network/http_client_factory.dart';
import '../../../core/utils/result.dart';
import '../../../domain/models/discovered_scanner.dart';
import '../../../domain/models/scan_job_status.dart';
import '../../../domain/models/scan_settings.dart';
import '../../../domain/models/scanner_capabilities.dart';
import 'escl_scan_client.dart';
import 'escl_scan_settings_xml_builder.dart';

class EsclScanClientImpl implements EsclScanClient {
  final PaperlessHttpClientFactory _clientFactory;
  final EsclScanSettingsXmlBuilder _xmlBuilder;
  
  late final Dio _dio;

  EsclScanClientImpl(this._clientFactory, this._xmlBuilder) {
    _dio = _clientFactory.createScannerClient();
  }

  @override
  Future<Result<String>> createScanJob(DiscoveredScanner scanner, ScanSettings settings) async {
    try {
      final xmlBody = _xmlBuilder.build(settings, scanner.capabilities!);
      
      final scheme = scanner.useTls ? 'https' : 'http';
      final rootUrl = '$scheme://${scanner.host}:${scanner.port}${scanner.esclRoot}';
      
      final response = await _dio.post(
        '$rootUrl/ScanJobs',
        data: xmlBody,
        options: Options(
          headers: {
            'Content-Type': 'text/xml',
          },
        ),
      );

      if (response.statusCode == 201) {
        final location = response.headers.value('Location');
        if (location != null && location.isNotEmpty) {
          // Some scanners return relative path, others absolute
          final jobUrl = location.startsWith('http') ? location : '$scheme://${scanner.host}:${scanner.port}$location';
          return right(jobUrl);
        } else {
          return left(const AppFailure.scanner(message: 'Missing Location header in 201 response.'));
        }
      }

      return left(AppFailure.scanner(message: 'Failed to create scan job, status: ${response.statusCode}'));
    } on DioException catch (e) {
      if (e.response?.statusCode == 503) {
        return left(const AppFailure.scanner(message: 'Scanner busy', code: ScannerErrorCode.busy));
      }
      return left(AppFailure.network(message: e.message ?? 'Network error', statusCode: e.response?.statusCode));
    } catch (e) {
      return left(AppFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<Uint8List?>> fetchNextDocument(String jobUrl) async {
    try {
      final response = await _dio.get<List<int>>(
        '$jobUrl/NextDocument',
        options: Options(
          responseType: ResponseType.bytes,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        return right(Uint8List.fromList(response.data!));
      } else if (response.statusCode == 404) {
        return right(null);
      } else if (response.statusCode == 409) {
        try {
          final stringData = String.fromCharCodes(response.data ?? []);
          if (stringData.contains('ScannerAdfEmpty')) {
             return right(null);
          }
        } catch (_) {}
        return left(AppFailure.scanner(message: 'Conflict error during fetch: ${response.statusCode}'));
      }
      
      return left(AppFailure.scanner(message: 'Unexpected status: ${response.statusCode}'));
    } on DioException catch (e) {
      return left(AppFailure.network(message: e.message ?? 'Network error', statusCode: e.response?.statusCode));
    } catch (e) {
      return left(AppFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<ScanJobStatus>> getJobStatus(String jobUrl) async {
    try {
      final response = await _dio.get(
        '$jobUrl/ScanJobStatus',
        options: Options(
          responseType: ResponseType.plain,
        ),
      );

      if (response.statusCode == 200) {
        final document = XmlDocument.parse(response.data.toString());
        final stateElement = document.findAllElements('pwg:JobState').firstOrNull;
        final stateStr = stateElement?.innerText ?? '';
        
        ScanJobState state = ScanJobState.unknown;
        if (stateStr.contains('Pending')) {
          state = ScanJobState.pending;
        } else if (stateStr.contains('Processing')) {
          state = ScanJobState.processing;
        } else if (stateStr.contains('Canceled')) {
          state = ScanJobState.canceled;
        } else if (stateStr.contains('Completed')) {
          state = ScanJobState.completed;
        } else if (stateStr.contains('Aborted')) {
          state = ScanJobState.aborted;
        }

        final ageElement = document.findAllElements('scan:Age').firstOrNull;
        final age = int.tryParse(ageElement?.innerText ?? '');

        return right(ScanJobStatus(state: state, age: age));
      }
      
      return left(AppFailure.scanner(message: 'Failed to get job status: ${response.statusCode}'));
    } on DioException catch (e) {
      return left(AppFailure.network(message: e.message ?? 'Network error', statusCode: e.response?.statusCode));
    } catch (e) {
      return left(AppFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<void>> cancelJob(String jobUrl) async {
    try {
      final response = await _dio.delete(jobUrl);
      if (response.statusCode == 200 || response.statusCode == 204) {
        return right(null);
      }
      return left(AppFailure.scanner(message: 'Failed to cancel job: ${response.statusCode}'));
    } on DioException catch (e) {
      return left(AppFailure.network(message: e.message ?? 'Network error', statusCode: e.response?.statusCode));
    } catch (e) {
      return left(AppFailure.unknown(message: e.toString()));
    }
  }

  @override
  Stream<Uint8List> scanAllPages(DiscoveredScanner scanner, ScanSettings settings) async* {
    final isAdf = settings.inputSource == InputSource.adfSimplex || settings.inputSource == InputSource.adfDuplex;

    while (true) {
      final createResult = await createScanJob(scanner, settings);
      
      final jobUrl = createResult.fold(
        (failure) => throw Exception(failure.message),
        (url) => url,
      );

      bool lastFetchWasNull = false;

      while (true) {
        final pageResult = await fetchNextDocument(jobUrl);
        
        final pageBytes = pageResult.fold(
          (failure) => throw Exception(failure.message),
          (bytes) => bytes,
        );

        if (pageBytes == null) {
          lastFetchWasNull = true;
          break; // break inner
        }

        yield pageBytes;
        lastFetchWasNull = false;
        
        await Future.delayed(const Duration(milliseconds: 500));
      }

      if (!isAdf) break; // break outer
      if (lastFetchWasNull) break; // break outer
    }
  }
}
