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
  }) = _AuthConfig;

  factory AuthConfig.fromJson(Map<String, dynamic> json) => _$AuthConfigFromJson(json);
}
