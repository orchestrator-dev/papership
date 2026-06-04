import 'package:freezed_annotation/freezed_annotation.dart';
import 'scanner_capabilities.dart';

part 'scan_settings.freezed.dart';
part 'scan_settings.g.dart';

@freezed
abstract class ScanSettings with _$ScanSettings {
  const factory ScanSettings({
    required InputSource inputSource,
    required ColorMode colorMode,
    required int resolution,
    required DocumentFormat format,
    @Default(false) bool duplex,
    ScanRegion? scanRegion,
  }) = _ScanSettings;

  factory ScanSettings.fromJson(Map<String, dynamic> json) => _$ScanSettingsFromJson(json);
}
