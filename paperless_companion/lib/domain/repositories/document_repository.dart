import 'dart:typed_data';

import '../../core/utils/result.dart';
import '../../data/remote/dto/paginated_response.dart';
import '../../data/remote/dto/document_dto.dart';
import '../models/document.dart';
import '../models/document_filter.dart';

abstract class DocumentRepository {
  Future<Result<PaginatedResponse<Document>>> getDocuments(DocumentFilter filter);
  Future<Result<Document>> getDocument(int id);
  Future<Result<Document>> updateDocument(int id, DocumentUpdateDto dto);
  Future<Result<Uint8List>> downloadDocument(int id);
  Future<Result<Uint8List>> getDocumentPreview(int id);
}
