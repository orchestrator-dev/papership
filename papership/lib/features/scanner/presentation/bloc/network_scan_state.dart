import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/models/discovered_scanner.dart';

part 'network_scan_state.freezed.dart';

@freezed
abstract class NetworkScanState with _$NetworkScanState {
  const factory NetworkScanState.discovering({
    @Default([]) List<DiscoveredScanner> scanners,
  }) = _Discovering;

  const factory NetworkScanState.discovered(
    List<DiscoveredScanner> scanners,
  ) = _Discovered;

  const factory NetworkScanState.selectingSettings(
    DiscoveredScanner scanner,
    List<DiscoveredScanner> scanners,
  ) = _SelectingSettings;

  const factory NetworkScanState.scanning(
    DiscoveredScanner scanner,
    int pageCount,
  ) = _Scanning;

  const factory NetworkScanState.error(
    String message,
    DiscoveredScanner? scanner,
  ) = _Error;
}
