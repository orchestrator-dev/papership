import 'package:injectable/injectable.dart';
import '../../core/utils/result.dart';
import '../../data/remote/dto/document_dto.dart';
import '../models/document.dart';
import '../repositories/document_repository.dart';

@injectable
class UpdateDocumentUseCase {
  final DocumentRepository _repository;

  UpdateDocumentUseCase(this._repository);

  Future<Result<Document>> call(int id, DocumentUpdateDto dto) {
    return _repository.updateDocument(id, dto);
  }
}
