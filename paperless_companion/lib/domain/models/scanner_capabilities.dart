import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_capabilities.freezed.dart';
part 'scanner_capabilities.g.dart';

@freezed
abstract class ScannerCapabilities with _$ScannerCapabilities {
  const factory ScannerCapabilities({
    required String makeAndModel,
    required List<InputSource> inputSources,
    required List<ColorMode> colorModes,
    required List<int> supportedResolutions,
    required DocumentFormat defaultFormat,
    required List<DocumentFormat> supportedFormats,
    required ScanRegion maxScanRegion,
    required bool supportsAdf,
    required bool supportsDuplex,
    String? serialNumber,
    String? adminUri,
  }) = _ScannerCapabilities;

  factory ScannerCapabilities.fromJson(Map<String, dynamic> json) => _$ScannerCapabilitiesFromJson(json);
}

enum InputSource { platen, adfSimplex, adfDuplex }
enum ColorMode { blackAndWhite, grayscale, color }
enum DocumentFormat { pdf, jpeg, png }

@freezed
abstract class ScanRegion with _$ScanRegion {
  const factory ScanRegion({
    required int width,
    required int height,
  }) = _ScanRegion;

  factory ScanRegion.fromJson(Map<String, dynamic> json) => _$ScanRegionFromJson(json);
}
