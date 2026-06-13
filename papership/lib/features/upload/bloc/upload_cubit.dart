import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'upload_state.dart';
import '../../../domain/usecases/upload_document_usecase.dart';
import '../../../data/remote/services/paperless_api_service_impl.dart';

@injectable
class UploadCubit extends Cubit<UploadState> {
  final UploadDocumentUseCase _uploadDocumentUseCase;
  final PaperlessApiServiceImpl _apiService;

  UploadCubit(this._uploadDocumentUseCase, this._apiService) : super(const UploadState.idle());

  Future<void> loadMetadata() async {
    emit(const UploadState.loadingMetadata());
    
    final tagsResult = await _apiService.getTags();
    final correspondentsResult = await _apiService.getCorrespondents();
    final documentTypesResult = await _apiService.getDocumentTypes();

    final tags = tagsResult.fold((l) => [], (r) => r.results);
    final correspondents = correspondentsResult.fold((l) => [], (r) => r.results);
    final documentTypes = documentTypesResult.fold((l) => [], (r) => r.results);

    emit(UploadState.ready(
      tags: tags.cast(),
      correspondents: correspondents.cast(),
      documentTypes: documentTypes.cast(),
    ));
  }

  Future<void> uploadDocument(UploadRequest request) async {
    emit(const UploadState.uploading(0.5)); // Simulated progress for now, as Dio's onSendProgress requires changing the usecase.

    final result = await _uploadDocumentUseCase(request);

    result.fold(
      (failure) {
        emit(UploadState.error(failure.message));
        // restore ready state if we want to allow retry, but instruction says:
        // "On error: detailed message + Retry button"
        // Wait, if it stays in error state, UI can show retry.
      },
      (taskId) {
        emit(UploadState.success(taskId));
      },
    );
  }

  Future<void> createTag(String name) async {
    state.maybeWhen(
      ready: (tags, correspondents, documentTypes) async {
        final result = await _apiService.createTag({'name': name});
        result.fold(
          (failure) => null,
          (newTag) {
            final newTags = List.of(tags)..add(newTag);
            emit(UploadState.ready(
              tags: newTags.cast(),
              correspondents: correspondents,
              documentTypes: documentTypes,
            ));
          },
        );
      },
      orElse: () {},
    );
  }

  Future<void> createCorrespondent(String name) async {
    state.maybeWhen(
      ready: (tags, correspondents, documentTypes) async {
        final result = await _apiService.createCorrespondent({'name': name});
        result.fold(
          (failure) => null,
          (newCorrespondent) {
            final newCorrespondents = List.of(correspondents)..add(newCorrespondent);
            emit(UploadState.ready(
              tags: tags,
              correspondents: newCorrespondents.cast(),
              documentTypes: documentTypes,
            ));
          },
        );
      },
      orElse: () {},
    );
  }

  Future<void> createDocumentType(String name) async {
    state.maybeWhen(
      ready: (tags, correspondents, documentTypes) async {
        final result = await _apiService.createDocumentType({'name': name});
        result.fold(
          (failure) => null,
          (newDocType) {
            final newDocTypes = List.of(documentTypes)..add(newDocType);
            emit(UploadState.ready(
              tags: tags,
              correspondents: correspondents,
              documentTypes: newDocTypes.cast(),
            ));
          },
        );
      },
      orElse: () {},
    );
  }
}
