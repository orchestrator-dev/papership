import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papership/features/scan_session/bloc/scan_session_cubit.dart';
import 'package:papership/features/scan_session/models/scan_session.dart';
import 'package:papership/features/scan_session/presentation/scan_session_screen.dart';

void main() {
  late ScanSessionCubit cubit;

  setUp(() {
    cubit = ScanSessionCubit(sessionId: 'test-session-1');
  });

  tearDown(() {
    cubit.close();
  });

  Widget buildTestWidget() {
    return MaterialApp(
      home: BlocProvider.value(
        value: cubit,
        child: const ScanSessionScreen(),
      ),
    );
  }

  testWidgets('rotate updates degrees immediately in state and UI', (tester) async {
    cubit.addPage(ScannedPage(id: 'page1', source: ScannedPageSource.camera, imageBytes: Uint8List(0)));
    await tester.pumpWidget(buildTestWidget());

    expect(cubit.state.pages[0].rotationDegrees, 0);

    await tester.tap(find.text('Rotate'));
    await tester.pump();

    expect(cubit.state.pages[0].rotationDegrees, 90);
  });

  testWidgets('reorder changes order in state', (tester) async {
    cubit.addPage(ScannedPage(id: 'page1', source: ScannedPageSource.camera, imageBytes: Uint8List(0)));
    cubit.addPage(ScannedPage(id: 'page2', source: ScannedPageSource.camera, imageBytes: Uint8List(0)));
    
    await tester.pumpWidget(buildTestWidget());

    // Enter reorder mode
    await tester.longPress(find.byKey(const ValueKey('page1')));
    await tester.pumpAndSettle();

    expect(find.text('Done Reordering'), findsOneWidget);
    
    // Testing the Cubit reorderPage logic directly:
    cubit.reorderPage(0, 2);
    expect(cubit.state.pages[0].id, 'page2');
    expect(cubit.state.pages[1].id, 'page1');
  });

  testWidgets('delete + undo restores page', (tester) async {
    cubit.addPage(ScannedPage(id: 'page1', source: ScannedPageSource.camera, imageBytes: Uint8List(0)));
    await tester.pumpWidget(buildTestWidget());

    expect(cubit.state.pages[0].excluded, isFalse);

    // Tap Delete
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    // Confirm Delete
    await tester.tap(find.text('Delete').last);
    await tester.pumpAndSettle();

    expect(cubit.state.pages[0].excluded, isTrue);

    // Tap Undo
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();

    expect(cubit.state.pages[0].excluded, isFalse);
  });
}
