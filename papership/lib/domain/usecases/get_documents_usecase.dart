import 'package:injectable/injectable.dart';

import '../../core/utils/result.dart';
import '../../data/remote/dto/paginated_response.dart';
import '../models/document.dart';
import '../models/document_filter.dart';
import '../repositories/document_repository.dart';

@lazySingleton
class GetDocumentsUseCase {
  final DocumentRepository _repository;

  GetDocumentsUseCase(this._repository);

  Future<Result<PaginatedResponse<Document>>> call(DocumentFilter filter) {
    return _repository.getDocuments(filter);
  }
}
