import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/app_failure.dart';
import '../../core/utils/result.dart';
import '../../domain/models/document.dart';
import '../../domain/models/document_filter.dart';
import '../../domain/repositories/document_repository.dart';
import '../remote/dto/paginated_response.dart';
import '../remote/dto/document_dto.dart';
import '../remote/services/paperless_api_service.dart';

@LazySingleton(as: DocumentRepository)
class DocumentRepositoryImpl implements DocumentRepository {
  final PaperlessApiService _apiService;

  DocumentRepositoryImpl(this._apiService);

  @override
  Future<Result<PaginatedResponse<Document>>> getDocuments(DocumentFilter filter) async {
    try {
      final response = await _apiService.getDocuments(
        query: filter.query,
        page: filter.page,
        tagIds: filter.tagIds,
        correspondentId: filter.correspondentId,
        documentTypeId: filter.documentTypeId,
        ordering: filter.ordering,
      );
      return Right(response);
    } catch (e) {
      return Left(AppFailure.network(message: e.toString()));
    }
  }

  @override
  Future<Result<Document>> getDocument(int id) async {
    try {
      final response = await _apiService.getDocument(id);
      return Right(response);
    } catch (e) {
      return Left(AppFailure.network(message: e.toString()));
    }
  }

  @override
  Future<Result<Document>> updateDocument(int id, DocumentUpdateDto dto) async {
    try {
      final response = await _apiService.updateDocument(id, dto);
      return Right(response);
    } catch (e) {
      return Left(AppFailure.network(message: e.toString()));
    }
  }

  @override
  Future<Result<Uint8List>> downloadDocument(int id) async {
    try {
      final response = await _apiService.downloadDocument(id);
      return Right(Uint8List.fromList(response));
    } catch (e) {
      return Left(AppFailure.network(message: e.toString()));
    }
  }

  @override
  Future<Result<Uint8List>> getDocumentPreview(int id) async {
    try {
      final response = await _apiService.getDocumentPreview(id);
      return Right(Uint8List.fromList(response));
    } catch (e) {
      return Left(AppFailure.network(message: e.toString()));
    }
  }
}
