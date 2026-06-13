import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens.dart';
import '../features/upload/presentation/pending_uploads_screen.dart';
import 'app_shell.dart';
import '../injection_container.dart';
import '../features/settings/presentation/bloc/server_config_cubit.dart';
import '../features/settings/presentation/bloc/server_config_state.dart';
import '../features/settings/presentation/screens/settings_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorDocumentsKey = GlobalKey<NavigatorState>(debugLabel: 'shellDocuments');
final GlobalKey<NavigatorState> _shellNavigatorScanKey = GlobalKey<NavigatorState>(debugLabel: 'shellScan');
final GlobalKey<NavigatorState> _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  redirect: (context, state) {
    final serverCubit = sl<ServerConfigCubit>();
    final serverState = serverCubit.state;
    
    final bool hasServer = serverState.mapOrNull(
      list: (value) => value.configs.isNotEmpty,
    ) ?? false;

    final isGoingToSettings = state.matchedLocation.startsWith('/settings/server');

    if (!hasServer && !isGoingToSettings) {
      return '/settings/server';
    }
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDocumentsKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const DocumentListScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorScanKey,
          routes: [
            // Dummy route for Scan tab to work with index
            GoRoute(
              path: '/scan_tab',
              builder: (context, state) => const Scaffold(body: Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const GeneralSettingsScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/documents/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DocumentDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/scan',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const ScanSessionScreen(),
      routes: [
        GoRoute(
          path: 'network',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const NetworkScannerScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/upload',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const UploadScreen(),
    ),
    GoRoute(
      path: '/settings/pending_uploads',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const PendingUploadsScreen(),
    ),
    GoRoute(
      path: '/settings/server',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const ServerConfigWizard(),
    ),
    GoRoute(
      path: '/settings/server/:id',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return EditServerScreen(id: id);
      },
    ),
    GoRoute(
      path: '/login',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
