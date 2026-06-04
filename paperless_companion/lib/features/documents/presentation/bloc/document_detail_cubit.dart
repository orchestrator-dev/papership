// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../data/remote/dto/document_dto.dart';
import '../../../../domain/usecases/get_document_usecase.dart';
import '../../../../domain/usecases/update_document_usecase.dart';
import '../../../../domain/usecases/download_document_usecase.dart';
import '../../../../domain/usecases/get_document_preview_usecase.dart';
import 'document_detail_state.dart';

@injectable
class DocumentDetailCubit extends Cubit<DocumentDetailState> {
  final GetDocumentUseCase _getDocumentUseCase;
  final UpdateDocumentUseCase _updateDocumentUseCase;
  final DownloadDocumentUseCase _downloadDocumentUseCase;
  final GetDocumentPreviewUseCase _getDocumentPreviewUseCase;

  DocumentDetailCubit(
    this._getDocumentUseCase,
    this._updateDocumentUseCase,
    this._downloadDocumentUseCase,
    this._getDocumentPreviewUseCase,
  ) : super(const DocumentDetailState.loading());

  Future<void> loadDocument(int id) async {
    emit(const DocumentDetailState.loading());
    final result = await _getDocumentUseCase(id);
    result.fold(
      (failure) => emit(DocumentDetailState.error(failure.message)),
      (document) async {
        emit(DocumentDetailState.loaded(document: document));
        // Also fetch preview in background
        final previewResult = await _getDocumentPreviewUseCase(id);
        previewResult.fold(
          (_) {}, // ignore error for preview
          (bytes) {
            state.maybeMap(
              loaded: (s) => emit(DocumentDetailState.loaded(document: s.document, previewBytes: bytes)),
              orElse: () {},
            );
          },
        );
      },
    );
  }

  void startEditing() {
    state.maybeMap(
      loaded: (s) => emit(DocumentDetailState.editing(document: s.document)),
      orElse: () {},
    );
  }

  void cancelEditing() {
    state.maybeMap(
      editing: (s) {
        emit(DocumentDetailState.loading());
        loadDocument(s.document.id); // Reload to discard changes
      },
      orElse: () {},
    );
  }

  Future<void> saveDocument(int id, DocumentUpdateDto updateDto) async {
    state.maybeMap(
      editing: (s) async {
        emit(DocumentDetailState.saving(document: s.document));
        final result = await _updateDocumentUseCase(id, updateDto);
        result.fold(
          (failure) {
            emit(DocumentDetailState.error(failure.message));
            emit(DocumentDetailState.editing(document: s.document));
          },
          (document) {
            emit(DocumentDetailState.loading());
            loadDocument(document.id); // Refresh fully
          },
        );
      },
      orElse: () {},
    );
  }

  Future<void> downloadDocument(int id, String fileName) async {
    final result = await _downloadDocumentUseCase(id);
    result.fold(
      (failure) {
        // We could emit a side effect or show error
      },
      (bytes) async {
        try {
          Directory? dir;
          if (Platform.isAndroid) {
            dir = Directory('/storage/emulated/0/Download');
            if (!await dir.exists()) dir = await getExternalStorageDirectory();
          } else {
            dir = await getApplicationDocumentsDirectory();
          }
          final file = File('${dir!.path}/$fileName');
          await file.writeAsBytes(bytes);
        } catch (e) {
          // ignore
        }
      },
    );
  }

  Future<void> shareDocument(int id, String fileName) async {
    final result = await _downloadDocumentUseCase(id);
    result.fold(
      (failure) {},
      (bytes) async {
        try {
          final tempDir = await getTemporaryDirectory();
          final file = File('${tempDir.path}/$fileName');
          await file.writeAsBytes(bytes);
          await Share.shareXFiles([XFile(file.path)]);
        } catch (e) {
          // ignore
        }
      },
    );
  }
}
