import 'package:injectable/injectable.dart';
import '../../core/utils/result.dart';
import '../models/document.dart';
import '../repositories/document_repository.dart';

@injectable
class GetDocumentUseCase {
  final DocumentRepository _repository;

  GetDocumentUseCase(this._repository);

  Future<Result<Document>> call(int id) {
    return _repository.getDocument(id);
  }
}
