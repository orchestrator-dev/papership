import 'package:freezed_annotation/freezed_annotation.dart';

import 'models/auth_strategy_type.dart';

part 'server_config.freezed.dart';
part 'server_config.g.dart';

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
