// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthConfig _$AuthConfigFromJson(Map<String, dynamic> json) => _AuthConfig(
  serverId: json['serverId'] as String,
  baseUrl: json['baseUrl'] as String,
  username: json['username'] as String?,
  password: json['password'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$AuthConfigToJson(_AuthConfig instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'baseUrl': instance.baseUrl,
      'username': instance.username,
      'password': instance.password,
      'token': instance.token,
    };
