// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanSettings _$ScanSettingsFromJson(Map<String, dynamic> json) =>
    _ScanSettings(
      inputSource: $enumDecode(_$InputSourceEnumMap, json['inputSource']),
      colorMode: $enumDecode(_$ColorModeEnumMap, json['colorMode']),
      resolution: (json['resolution'] as num).toInt(),
      format: $enumDecode(_$DocumentFormatEnumMap, json['format']),
      duplex: json['duplex'] as bool? ?? false,
      scanRegion: json['scanRegion'] == null
          ? null
          : ScanRegion.fromJson(json['scanRegion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScanSettingsToJson(_ScanSettings instance) =>
    <String, dynamic>{
      'inputSource': _$InputSourceEnumMap[instance.inputSource]!,
      'colorMode': _$ColorModeEnumMap[instance.colorMode]!,
      'resolution': instance.resolution,
      'format': _$DocumentFormatEnumMap[instance.format]!,
      'duplex': instance.duplex,
      'scanRegion': instance.scanRegion,
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
