// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovered_scanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscoveredScanner _$DiscoveredScannerFromJson(Map<String, dynamic> json) =>
    _DiscoveredScanner(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
      useTls: json['useTls'] as bool,
      esclRoot: json['esclRoot'] as String,
      capabilities: json['capabilities'] == null
          ? null
          : ScannerCapabilities.fromJson(
              json['capabilities'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DiscoveredScannerToJson(_DiscoveredScanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'host': instance.host,
      'port': instance.port,
      'useTls': instance.useTls,
      'esclRoot': instance.esclRoot,
      'capabilities': instance.capabilities,
    };
