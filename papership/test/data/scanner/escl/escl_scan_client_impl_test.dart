import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:papership/core/error/app_failure.dart';
import 'package:papership/core/network/http_client_factory.dart';
import 'package:papership/data/scanner/escl/escl_scan_client_impl.dart';
import 'package:papership/data/scanner/escl/escl_scan_settings_xml_builder.dart';
import 'package:papership/domain/models/discovered_scanner.dart';
import 'package:papership/domain/models/scan_settings.dart';
import 'package:papership/domain/models/scanner_capabilities.dart';

class MockPaperlessHttpClientFactory extends Mock implements PaperlessHttpClientFactory {}
class MockEsclScanSettingsXmlBuilder extends Mock implements EsclScanSettingsXmlBuilder {}
class MockDio extends Mock implements Dio {}

void main() {
  late MockPaperlessHttpClientFactory mockFactory;
  late MockEsclScanSettingsXmlBuilder mockXmlBuilder;
  late EsclScanClientImpl client;
  late MockDio mockDio;

  setUpAll(() {
    registerFallbackValue(const ScanSettings(
      inputSource: InputSource.platen,
      colorMode: ColorMode.color,
      resolution: 300,
      format: DocumentFormat.pdf,
    ));
    registerFallbackValue(const ScannerCapabilities(
      makeAndModel: 'Test',
      inputSources: [],
      colorModes: [],
      supportedResolutions: [],
      defaultFormat: DocumentFormat.pdf,
      supportedFormats: [],
      maxScanRegion: ScanRegion(width: 100, height: 100),
      supportsAdf: true,
      supportsDuplex: false,
    ));
    registerFallbackValue(RequestOptions(path: ''));
  });

  setUp(() {
    mockFactory = MockPaperlessHttpClientFactory();
    mockXmlBuilder = MockEsclScanSettingsXmlBuilder();
    mockDio = MockDio();
    
    when(() => mockFactory.createScannerClient()).thenReturn(mockDio);
    
    client = EsclScanClientImpl(mockFactory, mockXmlBuilder);
  });

  final tScanner = const DiscoveredScanner(
    id: 'test',
    displayName: 'Test Scanner',
    host: '192.168.1.10',
    port: 80,
    useTls: false,
    esclRoot: '/eSCL',
    capabilities: ScannerCapabilities(
      makeAndModel: 'Test',
      inputSources: [InputSource.adfSimplex, InputSource.platen],
      colorModes: [ColorMode.color],
      supportedResolutions: [300],
      defaultFormat: DocumentFormat.pdf,
      supportedFormats: [DocumentFormat.pdf],
      maxScanRegion: ScanRegion(width: 100, height: 100),
      supportsAdf: true,
      supportsDuplex: false,
    ),
  );

  final tSettings = const ScanSettings(
    inputSource: InputSource.platen,
    colorMode: ColorMode.color,
    resolution: 300,
    format: DocumentFormat.pdf,
  );

  group('createScanJob', () {
    test('returns job URL on success', () async {
      when(() => mockXmlBuilder.build(any(), any())).thenReturn('<xml/>');
      when(() => mockDio.post<dynamic>(any(), data: any(named: 'data'), options: any(named: 'options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                headers: Headers.fromMap({'location': ['/eSCL/ScanJobs/123']}),
              ));

      final result = await client.createScanJob(tScanner, tSettings);

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), 'http://192.168.1.10:80/eSCL/ScanJobs/123');
    });

    test('returns ScannerFailure on 503', () async {
      when(() => mockXmlBuilder.build(any(), any())).thenReturn('<xml/>');
      when(() => mockDio.post<dynamic>(any(), data: any(named: 'data'), options: any(named: 'options')))
          .thenThrow(DioException(
            requestOptions: RequestOptions(path: ''),
            response: Response(requestOptions: RequestOptions(path: ''), statusCode: 503),
          ));

      final result = await client.createScanJob(tScanner, tSettings);

      expect(result.isLeft(), true);
      final failure = result.getLeft().toNullable() as ScannerFailure;
      expect(failure.code, ScannerErrorCode.busy);
    });
  });

  group('fetchNextDocument', () {
    test('returns bytes on 200', () async {
      final bytes = utf8.encode('image_data');
      when(() => mockDio.get<List<int>>(any(), options: any(named: 'options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 200,
                data: bytes,
              ));

      final result = await client.fetchNextDocument('http://url');

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), Uint8List.fromList(bytes));
    });

    test('returns null on 404', () async {
      when(() => mockDio.get<List<int>>(any(), options: any(named: 'options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 404,
              ));

      final result = await client.fetchNextDocument('http://url');

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), null);
    });
    
    test('returns null on 409 with ScannerAdfEmpty', () async {
      when(() => mockDio.get<List<int>>(any(), options: any(named: 'options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 409,
                data: utf8.encode('<error>ScannerAdfEmpty</error>'),
              ));

      final result = await client.fetchNextDocument('http://url');

      expect(result.isRight(), true);
      expect(result.getRight().toNullable(), null);
    });
  });

  group('cancelJob', () {
    test('returns success on 200', () async {
      when(() => mockDio.delete<dynamic>(any()))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 200,
              ));

      final result = await client.cancelJob('http://url');

      expect(result.isRight(), true);
    });
  });

  group('scanAllPages', () {
    test('stops on null page', () async {
      // Mock create
      when(() => mockXmlBuilder.build(any(), any())).thenReturn('<xml/>');
      when(() => mockDio.post<dynamic>(any(), data: any(named: 'data'), options: any(named: 'options')))
          .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: ''),
                statusCode: 201,
                headers: Headers.fromMap({'location': ['/eSCL/ScanJobs/123']}),
              ));
              
      // Mock fetch
      final bytes = utf8.encode('image_data');
      var fetchCallCount = 0;
      when(() => mockDio.get<List<int>>(any(), options: any(named: 'options')))
          .thenAnswer((_) async {
            fetchCallCount++;
            if (fetchCallCount == 1) {
              return Response(requestOptions: RequestOptions(path: ''), statusCode: 200, data: bytes);
            } else {
              return Response(requestOptions: RequestOptions(path: ''), statusCode: 404);
            }
          });

      final stream = client.scanAllPages(tScanner, tSettings.copyWith(inputSource: InputSource.adfSimplex));
      final result = await stream.toList();

      expect(result.length, 1);
      expect(result[0], Uint8List.fromList(bytes));
      expect(fetchCallCount, 2);
    });
  });
}
