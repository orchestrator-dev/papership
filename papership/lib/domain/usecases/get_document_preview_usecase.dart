import 'dart:typed_data';
import 'package:injectable/injectable.dart';
import '../../core/utils/result.dart';
import '../repositories/document_repository.dart';

@injectable
class GetDocumentPreviewUseCase {
  final DocumentRepository _repository;

  GetDocumentPreviewUseCase(this._repository);

  Future<Result<Uint8List>> call(int id) {
    return _repository.getDocumentPreview(id);
  }
}
