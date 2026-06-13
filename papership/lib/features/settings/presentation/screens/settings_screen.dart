// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../injection_container.dart';
import '../bloc/settings_cubit.dart';
import '../bloc/settings_state.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  int _cacheSize = 0;
  bool _canCheckBiometrics = false;
  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _loadCacheSize();
    _checkBiometrics();
    _loadAppVersion();
  }

  Future<void> _loadCacheSize() async {
    final dir = await getTemporaryDirectory();
    int size = 0;
    try {
      if (dir.existsSync()) {
        dir.listSync(recursive: true, followLinks: false).forEach((FileSystemEntity entity) {
          if (entity is File) {
            size += entity.lengthSync();
          }
        });
      }
    } catch (_) {}
    if (mounted) {
      setState(() => _cacheSize = size);
    }
  }

  Future<void> _clearCache() async {
    final dir = await getTemporaryDirectory();
    try {
      if (dir.existsSync()) {
        for (var entity in dir.listSync()) {
          try {
            entity.deleteSync(recursive: true);
          } catch (_) {}
        }
      }
    } catch (_) {}
    _loadCacheSize();
  }

  Future<void> _checkBiometrics() async {
    final auth = sl<LocalAuthentication>();
    final canCheck = await auth.canCheckBiometrics;
    final isDeviceSupported = await auth.isDeviceSupported();
    if (mounted) {
      setState(() => _canCheckBiometrics = canCheck && isDeviceSupported);
    }
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await sl.getAsync<PackageInfo>();
    if (mounted) {
      setState(() {
        _appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';
      });
    }
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          return ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.dns),
                title: const Text('Server Configuration'),
                onTap: () => context.push('/settings/server'),
              ),
              ListTile(
                leading: const Icon(Icons.cloud_upload),
                title: const Text('Pending Uploads'),
                onTap: () => context.push('/settings/pending_uploads'),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Security', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SwitchListTile(
                title: const Text('Biometric Lock'),
                value: state.isBiometricEnabled,
                onChanged: _canCheckBiometrics
                    ? (val) => cubit.setBiometricEnabled(val)
                    : null,
              ),
              if (state.isBiometricEnabled)
                ListTile(
                  title: const Text('Auto-lock timeout'),
                  subtitle: Text(_getTimeoutLabel(state.autoLockTimeoutMinutes)),
                  onTap: () => _showTimeoutDialog(context, state.autoLockTimeoutMinutes, cubit),
                ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Scanning', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                title: const Text('Default Resolution'),
                subtitle: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(value: 150, label: Text('150')),
                    ButtonSegment(value: 200, label: Text('200')),
                    ButtonSegment(value: 300, label: Text('300')),
                    ButtonSegment(value: 600, label: Text('600')),
                  ],
                  selected: {state.defaultScanResolution},
                  onSelectionChanged: (set) => cubit.setDefaultScanResolution(set.first),
                ),
              ),
              ListTile(
                title: const Text('Default Color Mode'),
                subtitle: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'Color', label: Text('Color')),
                    ButtonSegment(value: 'Grayscale', label: Text('Gray')),
                    ButtonSegment(value: 'B&W', label: Text('B&W')),
                  ],
                  selected: {state.defaultScanColorMode},
                  onSelectionChanged: (set) => cubit.setDefaultScanColorMode(set.first),
                ),
              ),
              ListTile(
                title: const Text('Default Scan Source'),
                subtitle: SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'Camera', label: Text('Camera')),
                    ButtonSegment(value: 'Network', label: Text('Network')),
                  ],
                  selected: {state.defaultScanSource},
                  onSelectionChanged: (set) => cubit.setDefaultScanSource(set.first),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('General', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                title: const Text('Theme Mode'),
                subtitle: SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(value: ThemeMode.system, label: Text('System')),
                    ButtonSegment(value: ThemeMode.light, label: Text('Light')),
                    ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
                  ],
                  selected: {state.themeMode},
                  onSelectionChanged: (set) => cubit.setThemeMode(set.first),
                ),
              ),
              ListTile(
                title: const Text('Cache Size'),
                subtitle: Text(_formatSize(_cacheSize)),
                trailing: TextButton(
                  onPressed: _clearCache,
                  child: const Text('Clear Cache'),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('App Version'),
                subtitle: Text(_appVersion),
              ),
            ],
          );
        },
      ),
    );
  }

  String _getTimeoutLabel(int minutes) {
    if (minutes == 0) return 'Immediately';
    if (minutes == -1) return 'Never';
    return '$minutes minutes';
  }

  void _showTimeoutDialog(BuildContext context, int currentTimeout, SettingsCubit cubit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Auto-lock timeout'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<int>(
                title: const Text('Immediately'),
                value: 0,
                groupValue: currentTimeout,
                onChanged: (val) {
                  cubit.setAutoLockTimeout(val!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<int>(
                title: const Text('1 minute'),
                value: 1,
                groupValue: currentTimeout,
                onChanged: (val) {
                  cubit.setAutoLockTimeout(val!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<int>(
                title: const Text('5 minutes'),
                value: 5,
                groupValue: currentTimeout,
                onChanged: (val) {
                  cubit.setAutoLockTimeout(val!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<int>(
                title: const Text('Never'),
                value: -1,
                groupValue: currentTimeout,
                onChanged: (val) {
                  cubit.setAutoLockTimeout(val!);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
