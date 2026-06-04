import 'package:dio/dio.dart';
import 'package:paperless_companion/core/auth/models/auth_config.dart';
import 'package:paperless_companion/core/auth/models/auth_credentials.dart';

abstract class AuthStrategy {
  String get id;
  String get displayName;

  /// Called once to authenticate. Returns persisted credentials.
  Future<AuthCredentials> authenticate(AuthConfig config);

  /// Called before each request. Mutates [options].
  Future<void> applyToRequest(RequestOptions options, AuthCredentials credentials);

  /// Called when a 401 is received. Return true if credentials were refreshed.
  Future<bool> refresh(AuthCredentials credentials);

  /// Serialize credentials to secure storage
  Map<String, String> serialize(AuthCredentials credentials);

  /// Deserialize credentials from secure storage
  AuthCredentials deserialize(Map<String, String> data);
}
