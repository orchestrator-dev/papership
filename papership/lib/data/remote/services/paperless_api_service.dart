import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/document_dto.dart';
import '../dto/tag_dto.dart';
import '../dto/correspondent_dto.dart';
import '../dto/document_type_dto.dart';
import '../dto/storage_path_dto.dart';
import '../dto/saved_view_dto.dart';
import '../dto/task_dto.dart';
import '../dto/user_profile_dto.dart';
import '../dto/paginated_response.dart';

part 'paperless_api_service.g.dart';

@RestApi()
abstract class PaperlessApiService {
  factory PaperlessApiService(Dio dio, {String baseUrl}) = _PaperlessApiService;

  // Documents
  @GET('/api/documents/')
  Future<PaginatedResponse<DocumentDto>> getDocuments({
    @Query('query') String? query,
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
    @Query('tags__id__all') String? tagIds,
    @Query('correspondent__id') int? correspondentId,
    @Query('document_type__id') int? documentTypeId,
    @Query('ordering') String? ordering,
  });

  @GET('/api/documents/{id}/')
  Future<DocumentDto> getDocument(@Path('id') int id);

  @PATCH('/api/documents/{id}/')
  Future<DocumentDto> updateDocument(@Path('id') int id, @Body() DocumentUpdateDto dto);

  @DELETE('/api/documents/{id}/')
  Future<void> deleteDocument(@Path('id') int id);

  @GET('/api/documents/{id}/download/')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> downloadDocument(@Path('id') int id);

  @GET('/api/documents/{id}/thumb/')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getDocumentThumbnail(@Path('id') int id);

  @GET('/api/documents/{id}/preview/')
  @DioResponseType(ResponseType.bytes)
  Future<List<int>> getDocumentPreview(@Path('id') int id);

  // Upload
  @POST('/api/documents/post_document/')
  @MultiPart()
  Future<String> uploadDocument(
    @Part(name: 'document') MultipartFile document,
    @Part(name: 'title') String? title,
    @Part(name: 'tags') List<String>? tags,
    @Part(name: 'correspondent') int? correspondentId,
    @Part(name: 'document_type') int? documentTypeId,
    @Part(name: 'created') String? createdDate,  // ISO 8601
    @Part(name: 'asn') String? asn,
  );

  // Metadata objects
  @GET('/api/tags/')
  Future<PaginatedResponse<TagDto>> getTags();

  @POST('/api/tags/')
  Future<TagDto> createTag(@Body() Map<String, dynamic> data);

  @GET('/api/correspondents/')
  Future<PaginatedResponse<CorrespondentDto>> getCorrespondents();

  @POST('/api/correspondents/')
  Future<CorrespondentDto> createCorrespondent(@Body() Map<String, dynamic> data);

  @GET('/api/document_types/')
  Future<PaginatedResponse<DocumentTypeDto>> getDocumentTypes();

  @POST('/api/document_types/')
  Future<DocumentTypeDto> createDocumentType(@Body() Map<String, dynamic> data);

  @GET('/api/storage_paths/')
  Future<PaginatedResponse<StoragePathDto>> getStoragePaths();

  @GET('/api/saved_views/')
  Future<PaginatedResponse<SavedViewDto>> getSavedViews();

  // Tasks
  @GET('/api/tasks/')
  Future<List<TaskDto>> getTasks();

  // User info
  @GET('/api/profile/')
  Future<UserProfileDto> getProfile();

  // Search autocomplete
  @GET('/api/search/autocomplete/')
  Future<List<String>> getAutocomplete(@Query('term') String term, @Query('limit') int limit);
}
