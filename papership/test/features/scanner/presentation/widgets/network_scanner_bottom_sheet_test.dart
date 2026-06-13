import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:papership/domain/models/discovered_scanner.dart';
import 'package:papership/domain/models/scanner_capabilities.dart';
import 'package:papership/features/scan_session/bloc/scan_session_cubit.dart';
import 'package:papership/features/scanner/presentation/bloc/network_scan_cubit.dart';
import 'package:papership/features/scanner/presentation/bloc/network_scan_state.dart';
import 'package:papership/features/scanner/presentation/widgets/network_scanner_bottom_sheet.dart';
import 'package:papership/features/scanner/presentation/widgets/scan_settings_panel.dart';

class MockNetworkScanCubit extends Mock implements NetworkScanCubit {}
class MockScanSessionCubit extends Mock implements ScanSessionCubit {}

void main() {
  late MockNetworkScanCubit networkScanCubit;
  late MockScanSessionCubit scanSessionCubit;

  final testCapabilities = const ScannerCapabilities(
    makeAndModel: 'Test Scanner',
    inputSources: [InputSource.platen, InputSource.adfSimplex],
    colorModes: [ColorMode.color, ColorMode.grayscale],
    supportedResolutions: [150, 300],
    defaultFormat: DocumentFormat.pdf,
    supportedFormats: [DocumentFormat.pdf, DocumentFormat.jpeg],
    maxScanRegion: ScanRegion(width: 2550, height: 3300),
    supportsAdf: true,
    supportsDuplex: false,
  );

  final testScanner = DiscoveredScanner(
    id: 'test_scanner_id',
    displayName: 'Test Scanner 123',
    host: '192.168.1.100',
    port: 8080,
    useTls: false,
    esclRoot: '/eSCL',
    capabilities: testCapabilities,
  );

  setUp(() {
    networkScanCubit = MockNetworkScanCubit();
    scanSessionCubit = MockScanSessionCubit();

    when(() => networkScanCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => scanSessionCubit.stream).thenAnswer((_) => const Stream.empty());
  });

  Widget buildTestWidget(NetworkScanState initialState) {
    when(() => networkScanCubit.state).thenReturn(initialState);
    
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<NetworkScanCubit>.value(value: networkScanCubit),
            BlocProvider<ScanSessionCubit>.value(value: scanSessionCubit),
          ],
          child: Builder(
            builder: (context) {
              return const NetworkScannerBottomSheet();
            }
          ),
        ),
      ),
    );
  }

  testWidgets('Scanner tile tap expands settings', (tester) async {
    await tester.pumpWidget(buildTestWidget(NetworkScanState.discovered([testScanner])));

    // Initially should show scanner tile
    expect(find.text('Test Scanner 123'), findsOneWidget);
    
    // Tap on the scanner
    await tester.tap(find.text('Test Scanner 123'));
    await tester.pumpAndSettle();

    verify(() => networkScanCubit.selectScanner(testScanner)).called(1);
  });

  testWidgets('Unsupported sources hidden in ScanSettingsPanel', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<NetworkScanCubit>.value(value: networkScanCubit),
            BlocProvider<ScanSessionCubit>.value(value: scanSessionCubit),
          ],
          child: ScanSettingsPanel(scanner: testScanner),
        ),
      ),
    ));

    // Supported sources
    expect(find.text('Platen'), findsOneWidget);
    expect(find.text('ADF Simplex'), findsOneWidget);
    
    // Unsupported sources should be hidden
    expect(find.text('ADF Duplex'), findsNothing);
    
    // Supported resolutions
    expect(find.text('150dpi'), findsOneWidget);
    expect(find.text('300dpi'), findsOneWidget);
    expect(find.text('600dpi'), findsNothing);
    
    // Supported color modes
    expect(find.text('Color'), findsOneWidget);
    expect(find.text('Grayscale'), findsOneWidget);
    expect(find.text('B&W'), findsNothing);
  });
}
