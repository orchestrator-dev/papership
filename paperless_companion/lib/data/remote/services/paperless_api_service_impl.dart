import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/app_failure.dart';
import '../../../core/utils/result.dart';
import 'paperless_api_service.dart';
import '../dto/document_dto.dart';
import '../dto/tag_dto.dart';
import '../dto/correspondent_dto.dart';
import '../dto/document_type_dto.dart';
import '../dto/storage_path_dto.dart';
import '../dto/saved_view_dto.dart';
import '../dto/task_dto.dart';
import '../dto/user_profile_dto.dart';
import '../dto/paginated_response.dart';

@LazySingleton()
class PaperlessApiServiceImpl {
  final PaperlessApiService _api;

  PaperlessApiServiceImpl(this._api);

  Future<Result<T>> _safeApiCall<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Result.right(result);
    } on DioException catch (e) {
      return Result.left(AppFailure.network(
        message: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode,
      ));
    } on FormatException catch (e) {
      return Result.left(AppFailure.parse(message: e.message));
    } catch (e) {
      if (e is TypeError || e.toString().contains('type')) {
         return Result.left(AppFailure.parse(message: e.toString()));
      }
      return Result.left(AppFailure.unknown(message: e.toString()));
    }
  }

  Future<Result<PaginatedResponse<DocumentDto>>> getDocuments({
    String? query,
    int? page,
    int? pageSize,
    String? tagIds,
    int? correspondentId,
    int? documentTypeId,
    String? ordering,
  }) => _safeApiCall(() => _api.getDocuments(
    query: query,
    page: page,
    pageSize: pageSize,
    tagIds: tagIds,
    correspondentId: correspondentId,
    documentTypeId: documentTypeId,
    ordering: ordering,
  ));

  Future<Result<DocumentDto>> getDocument(int id) =>
      _safeApiCall(() => _api.getDocument(id));

  Future<Result<DocumentDto>> updateDocument(int id, DocumentUpdateDto dto) =>
      _safeApiCall(() => _api.updateDocument(id, dto));

  Future<Result<void>> deleteDocument(int id) =>
      _safeApiCall(() => _api.deleteDocument(id));

  Future<Result<List<int>>> downloadDocument(int id) =>
      _safeApiCall(() => _api.downloadDocument(id));

  Future<Result<List<int>>> getDocumentThumbnail(int id) =>
      _safeApiCall(() => _api.getDocumentThumbnail(id));

  Future<Result<List<int>>> getDocumentPreview(int id) =>
      _safeApiCall(() => _api.getDocumentPreview(id));

  Future<Result<String>> uploadDocument(
    MultipartFile document, {
    String? title,
    List<int>? tags,
    int? correspondentId,
    int? documentTypeId,
    String? createdDate,
    String? asn,
  }) => _safeApiCall(() => _api.uploadDocument(
    document,
    title,
    tags?.map((e) => e.toString()).toList(),
    correspondentId,
    documentTypeId,
    createdDate,
    asn,
  ));

  Future<Result<PaginatedResponse<TagDto>>> getTags() =>
      _safeApiCall(() => _api.getTags());

  Future<Result<PaginatedResponse<CorrespondentDto>>> getCorrespondents() =>
      _safeApiCall(() => _api.getCorrespondents());

  Future<Result<PaginatedResponse<DocumentTypeDto>>> getDocumentTypes() =>
      _safeApiCall(() => _api.getDocumentTypes());

  Future<Result<PaginatedResponse<StoragePathDto>>> getStoragePaths() =>
      _safeApiCall(() => _api.getStoragePaths());

  Future<Result<PaginatedResponse<SavedViewDto>>> getSavedViews() =>
      _safeApiCall(() => _api.getSavedViews());

  Future<Result<List<TaskDto>>> getTasks() =>
      _safeApiCall(() => _api.getTasks());

  Future<Result<UserProfileDto>> getProfile() =>
      _safeApiCall(() => _api.getProfile());

  Future<Result<List<String>>> getAutocomplete(String term, int limit) =>
      _safeApiCall(() => _api.getAutocomplete(term, limit));
}
