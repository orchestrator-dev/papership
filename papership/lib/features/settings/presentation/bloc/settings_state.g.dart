// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    _SettingsState(
      isBiometricEnabled: json['isBiometricEnabled'] as bool? ?? false,
      autoLockTimeoutMinutes:
          (json['autoLockTimeoutMinutes'] as num?)?.toInt() ?? 0,
      defaultScanResolution:
          (json['defaultScanResolution'] as num?)?.toInt() ?? 300,
      defaultScanColorMode: json['defaultScanColorMode'] as String? ?? 'Color',
      defaultScanSource: json['defaultScanSource'] as String? ?? 'Camera',
      themeMode:
          $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$SettingsStateToJson(_SettingsState instance) =>
    <String, dynamic>{
      'isBiometricEnabled': instance.isBiometricEnabled,
      'autoLockTimeoutMinutes': instance.autoLockTimeoutMinutes,
      'defaultScanResolution': instance.defaultScanResolution,
      'defaultScanColorMode': instance.defaultScanColorMode,
      'defaultScanSource': instance.defaultScanSource,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
