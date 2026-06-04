// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/network/network_module.dart' as _i550;
import 'data/remote/services/paperless_api_service.dart' as _i359;
import 'data/remote/services/paperless_api_service_impl.dart' as _i175;
import 'data/repositories/document_repository_impl.dart' as _i394;
import 'domain/repositories/document_repository.dart' as _i822;
import 'domain/usecases/download_document_usecase.dart' as _i49;
import 'domain/usecases/get_document_preview_usecase.dart' as _i34;
import 'domain/usecases/get_document_usecase.dart' as _i117;
import 'domain/usecases/get_documents_usecase.dart' as _i1033;
import 'domain/usecases/update_document_usecase.dart' as _i840;
import 'features/documents/presentation/bloc/document_detail_cubit.dart'
    as _i105;
import 'features/documents/presentation/bloc/document_list_cubit.dart' as _i587;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i359.PaperlessApiService>(
      () => networkModule.getPaperlessApiService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i175.PaperlessApiServiceImpl>(
      () => _i175.PaperlessApiServiceImpl(gh<_i359.PaperlessApiService>()),
    );
    gh.lazySingleton<_i822.DocumentRepository>(
      () => _i394.DocumentRepositoryImpl(gh<_i359.PaperlessApiService>()),
    );
    gh.lazySingleton<_i1033.GetDocumentsUseCase>(
      () => _i1033.GetDocumentsUseCase(gh<_i822.DocumentRepository>()),
    );
    gh.factory<_i49.DownloadDocumentUseCase>(
      () => _i49.DownloadDocumentUseCase(gh<_i822.DocumentRepository>()),
    );
    gh.factory<_i34.GetDocumentPreviewUseCase>(
      () => _i34.GetDocumentPreviewUseCase(gh<_i822.DocumentRepository>()),
    );
    gh.factory<_i117.GetDocumentUseCase>(
      () => _i117.GetDocumentUseCase(gh<_i822.DocumentRepository>()),
    );
    gh.factory<_i840.UpdateDocumentUseCase>(
      () => _i840.UpdateDocumentUseCase(gh<_i822.DocumentRepository>()),
    );
    gh.factory<_i587.DocumentListCubit>(
      () => _i587.DocumentListCubit(gh<_i1033.GetDocumentsUseCase>()),
    );
    gh.factory<_i105.DocumentDetailCubit>(
      () => _i105.DocumentDetailCubit(
        gh<_i117.GetDocumentUseCase>(),
        gh<_i840.UpdateDocumentUseCase>(),
        gh<_i49.DownloadDocumentUseCase>(),
        gh<_i34.GetDocumentPreviewUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i550.NetworkModule {}
