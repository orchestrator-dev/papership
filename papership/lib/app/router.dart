import 'package:go_router/go_router.dart';
import 'screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DocumentListScreen(),
    ),
    GoRoute(
      path: '/documents/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DocumentDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const ScanSessionScreen(),
      routes: [
        GoRoute(
          path: 'network',
          builder: (context, state) => const NetworkScannerScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/upload',
      builder: (context, state) => const UploadScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          path: 'server',
          builder: (context, state) => const ServerConfigWizard(),
        ),
        GoRoute(
          path: 'server/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return EditServerScreen(id: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
