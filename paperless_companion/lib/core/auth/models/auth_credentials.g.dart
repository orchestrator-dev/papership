// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) =>
    _AuthCredentials(
      serverId: json['serverId'] as String?,
      baseUrl: json['baseUrl'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthCredentialsToJson(_AuthCredentials instance) =>
    <String, dynamic>{
      'serverId': instance.serverId,
      'baseUrl': instance.baseUrl,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'username': instance.username,
      'password': instance.password,
    };
