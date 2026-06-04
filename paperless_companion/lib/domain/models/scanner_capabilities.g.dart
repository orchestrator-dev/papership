// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner_capabilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScannerCapabilities _$ScannerCapabilitiesFromJson(Map<String, dynamic> json) =>
    _ScannerCapabilities(
      makeAndModel: json['makeAndModel'] as String,
      inputSources: (json['inputSources'] as List<dynamic>)
          .map((e) => $enumDecode(_$InputSourceEnumMap, e))
          .toList(),
      colorModes: (json['colorModes'] as List<dynamic>)
          .map((e) => $enumDecode(_$ColorModeEnumMap, e))
          .toList(),
      supportedResolutions: (json['supportedResolutions'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      defaultFormat: $enumDecode(
        _$DocumentFormatEnumMap,
        json['defaultFormat'],
      ),
      supportedFormats: (json['supportedFormats'] as List<dynamic>)
          .map((e) => $enumDecode(_$DocumentFormatEnumMap, e))
          .toList(),
      maxScanRegion: ScanRegion.fromJson(
        json['maxScanRegion'] as Map<String, dynamic>,
      ),
      supportsAdf: json['supportsAdf'] as bool,
      supportsDuplex: json['supportsDuplex'] as bool,
      serialNumber: json['serialNumber'] as String?,
      adminUri: json['adminUri'] as String?,
    );

Map<String, dynamic> _$ScannerCapabilitiesToJson(
  _ScannerCapabilities instance,
) => <String, dynamic>{
  'makeAndModel': instance.makeAndModel,
  'inputSources': instance.inputSources
      .map((e) => _$InputSourceEnumMap[e]!)
      .toList(),
  'colorModes': instance.colorModes.map((e) => _$ColorModeEnumMap[e]!).toList(),
  'supportedResolutions': instance.supportedResolutions,
  'defaultFormat': _$DocumentFormatEnumMap[instance.defaultFormat]!,
  'supportedFormats': instance.supportedFormats
      .map((e) => _$DocumentFormatEnumMap[e]!)
      .toList(),
  'maxScanRegion': instance.maxScanRegion,
  'supportsAdf': instance.supportsAdf,
  'supportsDuplex': instance.supportsDuplex,
  'serialNumber': instance.serialNumber,
  'adminUri': instance.adminUri,
};

const _$InputSourceEnumMap = {
  InputSource.platen: 'platen',
  InputSource.adfSimplex: 'adfSimplex',
  InputSource.adfDuplex: 'adfDuplex',
};

const _$ColorModeEnumMap = {
  ColorMode.blackAndWhite: 'blackAndWhite',
  ColorMode.grayscale: 'grayscale',
  ColorMode.color: 'color',
};

const _$DocumentFormatEnumMap = {
  DocumentFormat.pdf: 'pdf',
  DocumentFormat.jpeg: 'jpeg',
  DocumentFormat.png: 'png',
};

_ScanRegion _$ScanRegionFromJson(Map<String, dynamic> json) => _ScanRegion(
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
);

Map<String, dynamic> _$ScanRegionToJson(_ScanRegion instance) =>
    <String, dynamic>{'width': instance.width, 'height': instance.height};
