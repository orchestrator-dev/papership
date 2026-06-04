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
      caCertPath: json['caCertPath'] as String?,
      clientCertPath: json['clientCertPath'] as String?,
      clientCertPassword: json['clientCertPassword'] as String?,
      customHeaders: (json['customHeaders'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      oidcDiscoveryUrl: json['oidcDiscoveryUrl'] as String?,
      oidcClientId: json['oidcClientId'] as String?,
    );

Map<String, dynamic> _$ServerConfigToJson(_ServerConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'baseUrl': instance.baseUrl,
      'authType': _$AuthStrategyTypeEnumMap[instance.authType]!,
      'trustSelfSigned': instance.trustSelfSigned,
      'caCertPath': instance.caCertPath,
      'clientCertPath': instance.clientCertPath,
      'clientCertPassword': instance.clientCertPassword,
      'customHeaders': instance.customHeaders,
      'oidcDiscoveryUrl': instance.oidcDiscoveryUrl,
      'oidcClientId': instance.oidcClientId,
    };

const _$AuthStrategyTypeEnumMap = {
  AuthStrategyType.usernamePassword: 'usernamePassword',
  AuthStrategyType.apiToken: 'apiToken',
  AuthStrategyType.oidc: 'oidc',
  AuthStrategyType.customHeaders: 'customHeaders',
  AuthStrategyType.mtls: 'mtls',
};
