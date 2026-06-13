import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../features/settings/presentation/bloc/settings_cubit.dart';
import '../features/settings/presentation/bloc/server_config_cubit.dart';
import '../features/settings/presentation/bloc/server_config_state.dart';
import '../injection_container.dart';
import 'dart:ui';

class AppShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({super.key, required this.navigationShell});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with WidgetsBindingObserver {
  DateTime? _pausedTime;
  Timer? _pingTimer;
  final bool _isServerReachable = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startPingTimer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pingTimer?.cancel();
    super.dispose();
  }

  void _startPingTimer() {
    _pingTimer = Timer.periodic(const Duration(seconds: 60), (_) {
      // Implement ping logic here, wait I should use Dio or something
      // For now we just mock or use the server_config_cubit
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _pausedTime = DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      if (_pausedTime != null) {
        final settings = context.read<SettingsCubit>().state;
        if (settings.isBiometricEnabled) {
          final timeoutMinutes = settings.autoLockTimeoutMinutes;
          if (timeoutMinutes == 0 || (timeoutMinutes > 0 && DateTime.now().difference(_pausedTime!).inMinutes >= timeoutMinutes)) {
            _showLockScreen();
          }
        }
      }
      _pausedTime = null;
    }
  }

  void _showLockScreen() {
    Navigator.of(context, rootNavigator: true).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, anim1, anim2) => const LockScreen(),
      ),
    );
  }

  void _goBranch(int index) {
    if (index == 1) {
      // Scan tab: immediately launches ScanSessionScreen (new session) and pops back on complete
      context.push('/scan');
      return;
    }
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Papership'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: BlocBuilder<ServerConfigCubit, ServerConfigState>(
            builder: (context, state) {
              return state.mapOrNull(
                list: (value) {
                  if (value.configs.isEmpty) return const SizedBox.shrink();
                  final active = value.configs.firstWhere((c) => c.id == value.activeId);
                  if (active.trustSelfSigned) {
                    return Container(
                      color: Colors.orange,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text('Self-Signed Certificate Allowed', style: TextStyle(color: Colors.white, fontSize: 12)),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ) ?? const SizedBox.shrink();
            },
          ),
        ),
        actions: [
          BlocBuilder<ServerConfigCubit, ServerConfigState>(
            builder: (context, state) {
              return state.mapOrNull(
                list: (value) {
                  if (value.configs.isEmpty) return const SizedBox.shrink();
                  final active = value.configs.firstWhere((c) => c.id == value.activeId);
                  return InkWell(
                    onTap: () => context.push('/settings/server_list'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(active.displayName),
                          const SizedBox(width: 8),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _isServerReachable ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ) ?? const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: widget.navigationShell,
      floatingActionButton: widget.navigationShell.currentIndex == 0
          ? FloatingActionButton(
              onPressed: () => context.push('/scan'),
              child: const Icon(Icons.camera_alt),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description),
            label: 'Documents',
          ),
          NavigationDestination(
            icon: Icon(Icons.document_scanner_outlined),
            selectedIcon: Icon(Icons.document_scanner),
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final LocalAuthentication auth = sl<LocalAuthentication>();

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to access Papership',
      );
      if (authenticated && mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _authenticate,
                child: const Text('Unlock'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
