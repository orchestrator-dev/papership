// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerConfig _$ServerConfigFromJson(Map<String, dynamic> json) =>
    _ServerConfig(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      baseUrl: json['baseUrl'] as String,
      authType: $enumDecode(_$AuthStrategyTypeEnumMap, json['authType']),
      trustSelfSigned: json['trustSelfSigned'] as bool? ?? false,
      customHeaders: (json['customHeaders'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ServerConfigToJson(_ServerConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'baseUrl': instance.baseUrl,
      'authType': _$AuthStrategyTypeEnumMap[instance.authType]!,
      'trustSelfSigned': instance.trustSelfSigned,
      'customHeaders': instance.customHeaders,
    };

const _$AuthStrategyTypeEnumMap = {
  AuthStrategyType.token: 'token',
  AuthStrategyType.basic: 'basic',
  AuthStrategyType.oidc: 'oidc',
  AuthStrategyType.custom: 'custom',
};
