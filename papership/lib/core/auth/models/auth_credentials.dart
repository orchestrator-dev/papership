import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';
part 'auth_credentials.g.dart';

@freezed
abstract class AuthCredentials with _$AuthCredentials {
  const factory AuthCredentials({
    String? serverId,
    String? baseUrl,
    String? token,
    String? refreshToken,
    String? username,
    String? password,
    Map<String, String>? customHeaders,
    String? certificateBase64,
    String? oidcDiscoveryUrl,
    String? oidcClientId,
  }) = _AuthCredentials;

  factory AuthCredentials.fromJson(Map<String, dynamic> json) => _$AuthCredentialsFromJson(json);
}
