import 'package:freezed_annotation/freezed_annotation.dart';
import 'scanner_capabilities.dart';

part 'discovered_scanner.freezed.dart';
part 'discovered_scanner.g.dart';

@freezed
abstract class DiscoveredScanner with _$DiscoveredScanner {
  const factory DiscoveredScanner({
    required String id,           // mDNS instance name or 'manual:<host>'
    required String displayName,
    required String host,
    required int port,
    required bool useTls,
    required String esclRoot,     // e.g. "/eSCL" — from mDNS TXT record 'rs='
    ScannerCapabilities? capabilities,
  }) = _DiscoveredScanner;

  factory DiscoveredScanner.fromJson(Map<String, dynamic> json) => _$DiscoveredScannerFromJson(json);
}
