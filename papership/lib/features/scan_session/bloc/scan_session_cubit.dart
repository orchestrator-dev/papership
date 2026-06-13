import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/scan_session.dart';

class ScanSessionCubit extends Cubit<ScanSession> {
  ScanSessionCubit({required String sessionId})
      : super(ScanSession(id: sessionId, pages: []));

  void addPage(ScannedPage page) {
    final updatedPages = List<ScannedPage>.from(state.pages)..add(page);
    final selectedPageId = state.selectedPageId ?? page.id;
    emit(state.copyWith(pages: updatedPages, selectedPageId: selectedPageId));
  }

  void removePage(String pageId) {
    final updatedPages = state.pages.map((p) {
      if (p.id == pageId) {
        return p.copyWith(excluded: true);
      }
      return p;
    }).toList();
    
    // If the selected page is removed, try to select another one
    String? selectedPageId = state.selectedPageId;
    if (selectedPageId == pageId) {
        final availablePages = updatedPages.where((p) => !p.excluded).toList();
        selectedPageId = availablePages.isNotEmpty ? availablePages.first.id : null;
    }
    emit(state.copyWith(pages: updatedPages, selectedPageId: selectedPageId));
  }

  void undoRemove(String pageId) {
    final updatedPages = state.pages.map((p) {
      if (p.id == pageId) {
        return p.copyWith(excluded: false);
      }
      return p;
    }).toList();
    
    String? selectedPageId = state.selectedPageId;
    selectedPageId ??= pageId;
    emit(state.copyWith(pages: updatedPages, selectedPageId: selectedPageId));
  }

  void reorderPage(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final updatedPages = List<ScannedPage>.from(state.pages);
    final item = updatedPages.removeAt(oldIndex);
    updatedPages.insert(newIndex, item);
    emit(state.copyWith(pages: updatedPages));
  }

  void rotatePage(String pageId, int degrees) {
    final updatedPages = state.pages.map((p) {
      if (p.id == pageId) {
        return p.copyWith(
          rotationDegrees: (p.rotationDegrees + degrees) % 360,
        );
      }
      return p;
    }).toList();
    emit(state.copyWith(pages: updatedPages));
  }

  void updatePageAdjustments(
      String pageId, double brightness, double contrast) {
    final updatedPages = state.pages.map((p) {
      if (p.id == pageId) {
        return p.copyWith(
          brightnessAdjust: brightness,
          enhancedContrast: contrast,
        );
      }
      return p;
    }).toList();
    emit(state.copyWith(pages: updatedPages));
  }

  void setSessionTitle(String title) {
    emit(state.copyWith(uploadTitle: title));
  }

  void setMetadata({
    List<int>? tagIds,
    int? correspondentId,
    int? documentTypeId,
    DateTime? createdDate,
  }) {
    emit(state.copyWith(
      tagIds: tagIds ?? state.tagIds,
      correspondentId: correspondentId ?? state.correspondentId,
      documentTypeId: documentTypeId ?? state.documentTypeId,
      createdDate: createdDate ?? state.createdDate,
    ));
  }

  void selectPage(String pageId) {
    emit(state.copyWith(selectedPageId: pageId));
  }
}
