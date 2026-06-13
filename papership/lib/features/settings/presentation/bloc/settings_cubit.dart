import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'settings_state.dart';

@injectable
class SettingsCubit extends HydratedCubit<SettingsState> {
  final LocalAuthentication _localAuth;

  SettingsCubit(this._localAuth) : super(const SettingsState());

  Future<void> checkBiometrics() async {
    final canCheck = await _localAuth.canCheckBiometrics;
    final isDeviceSupported = await _localAuth.isDeviceSupported();
    if (!canCheck || !isDeviceSupported) {
      if (state.isBiometricEnabled) {
        emit(state.copyWith(isBiometricEnabled: false));
      }
    }
  }

  void setBiometricEnabled(bool enabled) {
    emit(state.copyWith(isBiometricEnabled: enabled));
  }

  void setAutoLockTimeout(int minutes) {
    emit(state.copyWith(autoLockTimeoutMinutes: minutes));
  }

  void setDefaultScanResolution(int resolution) {
    emit(state.copyWith(defaultScanResolution: resolution));
  }

  void setDefaultScanColorMode(String mode) {
    emit(state.copyWith(defaultScanColorMode: mode));
  }

  void setDefaultScanSource(String source) {
    emit(state.copyWith(defaultScanSource: source));
  }

  void setThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => SettingsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toJson();
}
