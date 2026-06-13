import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:papership/core/error/app_failure.dart';
import 'package:papership/data/remote/services/paperless_api_service.dart';
import 'package:papership/data/remote/services/paperless_api_service_impl.dart';
import 'package:papership/data/remote/dto/document_dto.dart';
import 'package:papership/data/remote/dto/paginated_response.dart';

class MockPaperlessApiService extends Mock implements PaperlessApiService {}

void main() {
  late PaperlessApiServiceImpl serviceImpl;
  late MockPaperlessApiService mockApi;

  setUp(() {
    mockApi = MockPaperlessApiService();
    serviceImpl = PaperlessApiServiceImpl(mockApi);
  });

  group('PaperlessApiServiceImpl', () {
    test('getDocuments should return DocumentDto on success', () async {
      final docDto = DocumentDto(
        id: 1,
        title: 'Test',
        content: null,
        tags: [],
        correspondent: null,
        documentType: null,
        storagePath: null,
        created: '2024-01-01T00:00:00Z',
        added: '2024-01-01T00:00:00Z',
        modified: '2024-01-01T00:00:00Z',
        asn: null,
        pageCount: 1,
        originalFileName: 'test.pdf',
        archivedFileName: 'test_archived.pdf',
      );
      final response = PaginatedResponse<DocumentDto>(count: 1, results: [docDto]);

      when(() => mockApi.getDocuments()).thenAnswer((_) async => response);

      final result = await serviceImpl.getDocuments();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Should be right'),
        (r) => expect(r.results.first.title, 'Test'),
      );
    });

    test('getDocuments should return NetworkFailure on DioException', () async {
      when(() => mockApi.getDocuments()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/api/documents/'),
          response: Response(
            requestOptions: RequestOptions(path: '/api/documents/'),
            statusCode: 404,
          ),
          message: 'Not found',
        ),
      );

      final result = await serviceImpl.getDocuments();

      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l, isA<NetworkFailure>());
          final failure = l as NetworkFailure;
          expect(failure.statusCode, 404);
          expect(failure.message, 'Not found');
        },
        (r) => fail('Should be left'),
      );
    });

    test('getDocuments should return ParseFailure on FormatException', () async {
      when(() => mockApi.getDocuments()).thenThrow(const FormatException('Invalid JSON'));

      final result = await serviceImpl.getDocuments();

      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l, isA<ParseFailure>());
          final failure = l as ParseFailure;
          expect(failure.message, 'Invalid JSON');
        },
        (r) => fail('Should be left'),
      );
    });
    
    test('getDocuments should return ParseFailure on TypeError (mapping issue)', () async {
      when(() => mockApi.getDocuments()).thenThrow(TypeError());

      final result = await serviceImpl.getDocuments();

      expect(result.isLeft(), true);
      result.fold(
        (l) {
          expect(l, isA<ParseFailure>());
        },
        (r) => fail('Should be left'),
      );
    });
  });
}
