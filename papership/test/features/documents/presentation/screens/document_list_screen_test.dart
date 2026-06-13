import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';

import 'package:papership/features/documents/presentation/screens/document_list_screen.dart';
import 'package:papership/features/documents/presentation/bloc/document_list_cubit.dart';
import 'package:papership/features/documents/presentation/bloc/document_list_state.dart';
import 'package:papership/domain/models/document_filter.dart';
import 'package:papership/domain/models/document.dart';

class MockDocumentListCubit extends MockCubit<DocumentListState> implements DocumentListCubit {}

class MockDio extends Mock implements Dio {
  @override
  BaseOptions get options => BaseOptions(baseUrl: 'http://test.lan');
}

void main() {
  late MockDocumentListCubit mockCubit;

  setUpAll(() {
    registerFallbackValue(const DocumentFilter());
  });

  setUp(() {
    mockCubit = MockDocumentListCubit();
    GetIt.I.registerSingleton<DocumentListCubit>(mockCubit);
    GetIt.I.registerSingleton<Dio>(MockDio());
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget buildSubject() {
    return MaterialApp(
      home: BlocProvider<DocumentListCubit>.value(
        value: mockCubit,
        child: const DocumentListScreen(),
      ),
    );
  }

  testWidgets('filter chip triggers new load', (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(const DocumentListState.initial());
    when(() => mockCubit.loadDocuments(filter: any(named: 'filter'))).thenAnswer((_) async {});
    when(() => mockCubit.updateFilter(any())).thenAnswer((_) {});

    await tester.pumpWidget(buildSubject());

    // Tap "All" chip
    await tester.tap(find.text('All'));
    await tester.pump();

    verify(() => mockCubit.updateFilter(const DocumentFilter())).called(1);
  });

  testWidgets('scroll triggers loadMore', (WidgetTester tester) async {
    final docs = List.generate(20, (i) => Document(
      id: i,
      title: 'Doc $i',
      content: null,
      tags: [],
      correspondent: null,
      documentType: null,
      storagePath: null,
      created: '2024-01-01T00:00:00Z',
      added: '2024-01-01T00:00:00Z',
      modified: '2024-01-01T00:00:00Z',
      asn: null,
      pageCount: null,
      originalFileName: 'file.pdf',
      archivedFileName: 'archived.pdf',
    ));
    when(() => mockCubit.state).thenReturn(DocumentListState.loaded(
      documents: docs,
      filter: const DocumentFilter(),
      hasMore: true,
    ));
    when(() => mockCubit.loadMore()).thenAnswer((_) async {});
    
    await tester.pumpWidget(buildSubject());

    // Trigger scroll
    await tester.drag(find.byType(ListView), const Offset(0, -3000));
    await tester.pump(const Duration(milliseconds: 100));

    verify(() => mockCubit.loadMore()).called(1);
  });
}
