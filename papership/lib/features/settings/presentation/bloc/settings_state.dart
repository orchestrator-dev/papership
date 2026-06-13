import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const SettingsState._();
  const factory SettingsState({
    @Default(false) bool isBiometricEnabled,
    @Default(0) int autoLockTimeoutMinutes,
    @Default(300) int defaultScanResolution,
    @Default('Color') String defaultScanColorMode,
    @Default('Camera') String defaultScanSource,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);
}
