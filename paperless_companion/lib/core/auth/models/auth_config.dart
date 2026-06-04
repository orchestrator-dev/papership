import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_config.freezed.dart';
part 'auth_config.g.dart';

@freezed
abstract class AuthConfig with _$AuthConfig {
  const factory AuthConfig({
    required String serverId,
    required String baseUrl,
    String? username,
    String? password,
    String? token,
    String? oidcDiscoveryUrl,
    String? oidcClientId,
    Map<String, String>? customHeaders,
    String? clientCertPath,
    String? clientCertPassword,
  }) = _AuthConfig;

  factory AuthConfig.fromJson(Map<String, dynamic> json) => _$AuthConfigFromJson(json);
}
