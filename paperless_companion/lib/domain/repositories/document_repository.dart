import '../../core/utils/result.dart';
import '../../data/remote/dto/paginated_response.dart';
import '../models/document.dart';
import '../models/document_filter.dart';

abstract class DocumentRepository {
  Future<Result<PaginatedResponse<Document>>> getDocuments(DocumentFilter filter);
}
