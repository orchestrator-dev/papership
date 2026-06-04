import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_config.freezed.dart';
part 'server_config.g.dart';

enum AuthStrategyType { token, basic, oidc, custom }

@freezed
abstract class ServerConfig with _$ServerConfig {
  const factory ServerConfig({
    required String id,
    required String displayName,
    required String baseUrl,
    required AuthStrategyType authType,
    @Default(false) bool trustSelfSigned,
    String? caCertPath,
    String? clientCertPath,
    String? clientCertPassword,
    Map<String, String>? customHeaders,
    String? oidcDiscoveryUrl,
    String? oidcClientId,
  }) = _ServerConfig;

  factory ServerConfig.fromJson(Map<String, dynamic> json) =>
      _$ServerConfigFromJson(json);
}
