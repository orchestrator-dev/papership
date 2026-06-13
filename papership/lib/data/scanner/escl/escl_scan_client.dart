import 'dart:typed_data';
import '../../../core/utils/result.dart';
import '../../../domain/models/discovered_scanner.dart';
import '../../../domain/models/scan_settings.dart';
import '../../../domain/models/scan_job_status.dart';

abstract class EsclScanClient {
  /// POST `esclRoot`/ScanJobs with ScanSettings XML
  /// Returns job URL from Location header (HTTP 201)
  Future<Result<String>> createScanJob(DiscoveredScanner scanner, ScanSettings settings);

  /// GET `jobUrl`/NextDocument — returns raw bytes (JPEG or PDF page)
  /// Returns null when ADF exhausted (HTTP 404 or 409 ServerError with 'ScannerAdfEmpty')
  Future<Result<Uint8List?>> fetchNextDocument(String jobUrl);

  /// GET `jobUrl`/ScanJobStatus
  Future<Result<ScanJobStatus>> getJobStatus(String jobUrl);

  /// DELETE `jobUrl`
  Future<Result<void>> cancelJob(String jobUrl);

  /// Full ADF multi-page scan loop
  Stream<Uint8List> scanAllPages(DiscoveredScanner scanner, ScanSettings settings);
}
