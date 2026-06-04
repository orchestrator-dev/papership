import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/document_filter.dart';
import '../../../../domain/usecases/get_documents_usecase.dart';
import 'document_list_state.dart';

@injectable
class DocumentListCubit extends HydratedCubit<DocumentListState> {
  final GetDocumentsUseCase _getDocumentsUseCase;

  DocumentListCubit(this._getDocumentsUseCase) : super(const DocumentListState.initial());

  Future<void> loadDocuments({DocumentFilter filter = const DocumentFilter()}) async {
    final filterToUse = filter.copyWith(page: 1);
    
    emit(DocumentListState.loading(filter: filterToUse));

    final result = await _getDocumentsUseCase(filterToUse);

    result.fold(
      (failure) => emit(DocumentListState.error(
        message: failure.message,
        filter: filterToUse,
      )),
      (response) {
        final hasMore = response.next != null;
        emit(DocumentListState.loaded(
          documents: response.results,
          filter: filterToUse,
          hasMore: hasMore,
        ));
      },
    );
  }

  Future<void> loadMore() async {
    await state.maybeMap(
      loaded: (loadedState) async {
        if (!loadedState.hasMore) return;

        final nextFilter = loadedState.filter.copyWith(page: loadedState.filter.page + 1);
        emit(DocumentListState.loading(
          documents: loadedState.documents,
          filter: nextFilter,
        ));

        final result = await _getDocumentsUseCase(nextFilter);

        result.fold(
          (failure) => emit(DocumentListState.error(
            message: failure.message,
            filter: nextFilter,
            documents: loadedState.documents,
          )),
          (response) {
            final hasMore = response.next != null;
            emit(DocumentListState.loaded(
              documents: [...loadedState.documents, ...response.results],
              filter: nextFilter,
              hasMore: hasMore,
            ));
          },
        );
      },
      orElse: () {},
    );
  }

  void updateFilter(DocumentFilter newFilter) {
    loadDocuments(filter: newFilter);
  }

  @override
  DocumentListState? fromJson(Map<String, dynamic> json) {
    try {
      return DocumentListState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(DocumentListState state) {
    return state.toJson();
  }
}
