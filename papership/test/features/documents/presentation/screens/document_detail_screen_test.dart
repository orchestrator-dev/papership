import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:papership/data/remote/dto/document_dto.dart';
import 'package:papership/features/documents/presentation/bloc/document_detail_cubit.dart';
import 'package:papership/features/documents/presentation/bloc/document_detail_state.dart';
import 'package:papership/features/documents/presentation/screens/document_detail_screen.dart';

class MockDocumentDetailCubit extends Mock implements DocumentDetailCubit {}
class FakeDocumentUpdateDto extends Fake implements DocumentUpdateDto {}

void main() {
  late MockDocumentDetailCubit mockCubit;

  setUpAll(() {
    registerFallbackValue(FakeDocumentUpdateDto());
  });

  setUp(() {
    mockCubit = MockDocumentDetailCubit();
  });

  final dummyDocument = DocumentDto(
    id: 1,
    title: 'Test Document',
    content: 'Content',
    tags: [10],
    correspondent: 2,
    documentType: 3,
    storagePath: 'path',
    created: '2024-01-01',
    added: '2024-01-01',
    modified: '2024-01-01',
    asn: 'ASN1',
    pageCount: 1,
    originalFileName: 'test.pdf',
    archivedFileName: 'test.pdf',
  );

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<DocumentDetailCubit>.value(
        value: mockCubit,
        child: const DocumentDetailScreen(documentId: 1),
      ),
    );
  }

  testWidgets('renders loaded state with metadata and tags', (tester) async {
    when(() => mockCubit.state).thenReturn(DocumentDetailState.loaded(document: dummyDocument, previewBytes: Uint8List(0)));
    when(() => mockCubit.stream).thenAnswer((_) => Stream.empty());
    when(() => mockCubit.loadDocument(any())).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Test Document'), findsOneWidget);
    expect(find.text('Created: 2024-01-01'), findsOneWidget);
    expect(find.text('Tag 10'), findsOneWidget);
  });

  testWidgets('opens edit metadata bottom sheet and saves', (tester) async {
    when(() => mockCubit.state).thenReturn(DocumentDetailState.loaded(document: dummyDocument, previewBytes: Uint8List(0)));
    when(() => mockCubit.stream).thenAnswer((_) => Stream.empty());
    when(() => mockCubit.loadDocument(any())).thenAnswer((_) async {});
    when(() => mockCubit.saveDocument(any(), any())).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest());

    // Tap edit icon or title
    await tester.tap(find.byIcon(Icons.edit).first);
    await tester.pumpAndSettle();

    // Verify bottom sheet is open
    expect(find.text('Edit Metadata'), findsWidgets);
    expect(find.byType(TextField), findsOneWidget);

    // Enter new title
    await tester.enterText(find.byType(TextField), 'Updated Title');
    
    // Tap Save
    await tester.tap(find.text('Save'));
    await tester.pump(const Duration(seconds: 1));

    verify(() => mockCubit.saveDocument(1, any())).called(1);
  });
}
