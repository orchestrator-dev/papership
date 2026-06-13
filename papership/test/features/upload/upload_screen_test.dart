import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papership/features/upload/bloc/upload_cubit.dart';
import 'package:papership/features/upload/bloc/upload_state.dart';
import 'package:papership/features/upload/presentation/upload_screen.dart';
import 'package:papership/domain/usecases/upload_document_usecase.dart';

class MockUploadCubit extends MockCubit<UploadState> implements UploadCubit {}
class FakeUploadRequest extends Fake implements UploadRequest {}

void main() {
  late MockUploadCubit mockCubit;

  setUpAll(() {
    registerFallbackValue(FakeUploadRequest());
  });

  setUp(() {
    mockCubit = MockUploadCubit();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<UploadCubit>.value(
        value: mockCubit,
        child: const UploadScreen(pdfBytes: [1, 2, 3]),
      ),
    );
  }

  testWidgets('title validation blocks upload', (tester) async {
    when(() => mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockCubit.state).thenReturn(const UploadState.ready());
    when(() => mockCubit.loadMetadata()).thenAnswer((_) async {});
    when(() => mockCubit.uploadDocument(any())).thenAnswer((_) async {});

    await tester.pumpWidget(buildSubject());
    await tester.pumpAndSettle();

    // Find the text field that represents the Title.
    // In our UI, it's a TextFormField with decoration labelText 'Title'
    // but the actual Title field might be found by finding a specific label.
    // Actually `find.byType(TextFormField).first` is reliable in this screen.
    final titleTextField = find.byType(TextFormField).first;

    // Tap the upload button
    await tester.ensureVisible(find.text('Upload Now'));
    await tester.tap(find.text('Upload Now'));
    await tester.pump();

    // Verification: it shouldn't call uploadDocument
    verifyNever(() => mockCubit.uploadDocument(any()));

    // Verify validation error
    expect(find.text('Title is required'), findsOneWidget);

    // Enter text and try again
    await tester.enterText(titleTextField, 'My Doc');
    await tester.pumpAndSettle();

    // Tap upload button again
    await tester.ensureVisible(find.text('Upload Now'));
    await tester.tap(find.text('Upload Now'));
    await tester.pumpAndSettle();

    verify(() => mockCubit.uploadDocument(any())).called(1);
  });
}
