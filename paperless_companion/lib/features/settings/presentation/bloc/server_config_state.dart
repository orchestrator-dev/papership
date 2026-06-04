import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/auth/server_config.dart';

part 'server_config_state.freezed.dart';

@freezed
class ServerConfigState with _$ServerConfigState {
  const factory ServerConfigState.empty() = _Empty;
  const factory ServerConfigState.list({
    required List<ServerConfig> configs,
    String? activeId,
  }) = _List;
  const factory ServerConfigState.testing() = _Testing;
  const factory ServerConfigState.testResult({
    required bool success,
    String? errorMessage,
  }) = _TestResult;
  const factory ServerConfigState.saving() = _Saving;
}
