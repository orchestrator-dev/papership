// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

import 'core/app_module.dart' as _i135;
import 'core/auth/server_config_repository.dart' as _i456;
import 'core/network/http_client_factory.dart' as _i914;
import 'core/network/network_module.dart' as _i550;
import 'data/pdf/pdf_generator_service.dart' as _i444;
import 'data/remote/services/paperless_api_service.dart' as _i359;
import 'data/remote/services/paperless_api_service_impl.dart' as _i175;
import 'data/repositories/document_repository_impl.dart' as _i394;
import 'data/scanner/camera/camera_scan_service.dart' as _i76;
import 'data/scanner/escl/escl_scan_client.dart' as _i608;
import 'data/scanner/escl/escl_scan_client_impl.dart' as _i128;
import 'data/scanner/escl/escl_scan_settings_xml_builder.dart' as _i168;
import 'data/scanner/mdns_scanner_discovery_service.dart' as _i732;
import 'data/scanner/secure_storage_manual_scanner_repository.dart' as _i315;
import 'domain/repositories/document_repository.dart' as _i822;
import 'domain/repositories/manual_scanner_repository.dart' as _i525;
import 'domain/services/scanner_discovery_service.dart' as _i810;
import 'domain/usecases/download_document_usecase.dart' as _i49;
import 'domain/usecases/generate_pdf_usecase.dart' as _i980;
import 'domain/usecases/get_document_preview_usecase.dart' as _i34;
import 'domain/usecases/get_document_usecase.dart' as _i117;
import 'domain/usecases/get_documents_usecase.dart' as _i1033;
import 'domain/usecases/update_document_usecase.dart' as _i840;
import 'domain/usecases/upload_document_usecase.dart' as _i887;
import 'features/documents/presentation/bloc/document_detail_cubit.dart'
    as _i105;
import 'features/documents/presentation/bloc/document_list_cubit.dart' as _i587;
import 'features/scan_session/presentation/bloc/camera_capture_cubit.dart'
    as _i862;
import 'features/scanner/presentation/bloc/network_scan_cubit.dart' as _i929;
import 'features/settings/presentation/bloc/server_config_cubit.dart' as _i11;
import 'features/settings/presentation/bloc/settings_cubit.dart' as _i235;
import 'features/upload/bloc/upload_cubit.dart' as _i139;
import 'features/upload/data/pending_upload_repository.dart' as _i967;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i444.PdfGeneratorService>(() => _i444.PdfGeneratorService());
    gh.factory<_i76.CameraScanService>(() => _i76.CameraScanService());
    gh.factory<_i168.EsclScanSettingsXmlBuilder>(
      () => _i168.EsclScanSettingsXmlBuilder(),
    );
    gh.lazySingleton<_i152.LocalAuthentication>(() => appModule.localAuth);
    await gh.lazySingletonAsync<_i655.PackageInfo>(
      () => appModule.packageInfo,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => networkModule.flutterSecureStorage,
    );
    gh.lazySingleton<_i967.PendingUploadRepository>(
      () => _i967.PendingUploadRepositoryImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i456.ServerConfigRepository>(
      () => _i456.ServerConfigRepositoryImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i525.ManualScannerRepository>(
      () => _i315.SecureStorageManualScannerRepository(
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i810.ScannerDiscoveryService>(
      () => _i732.MdnsScannerDiscoveryService(),
    );
    gh.factory<_i980.GeneratePdfUseCase>(
      () => _i980.GeneratePdfUseCase(gh<_i444.PdfGeneratorService>()),
    );
    gh.lazySingleton<_i359.PaperlessApiService>(
      () => networkModule.getPaperlessApiService(gh<_i361.Dio>()),
    );
    gh.factoryParam<
      _i914.PaperlessHttpClientFactory,
      _i914.AuthFailureCallback?,
      dynamic
    >(
      (onAuthFailure, _) =>
          _i914.PaperlessHttpClientFactory(onAuthFailure: onAuthFailure),
    );
    gh.factory<_i235.SettingsCubit>(
      () => _i235.SettingsCubit(gh<_i152.LocalAuthentication>()),
    );
    gh.factory<_i862.CameraCaptureCubit>(
      () => _i862.CameraCaptureCubit(gh<_i76.CameraScanService>()),
    );
    gh.factory<_i11.ServerConfigCubit>(
      () => _i11.ServerConfigCubit(
        gh<_i456.ServerConfigRepository>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i822.DocumentRepository>(
      () => _i394.DocumentRepositoryImpl(gh<_i359.PaperlessApiService>()),
    );
    gh.lazySingleton<_i175.PaperlessApiServiceImpl>(
      () => _i175.PaperlessApiServiceImpl(gh<_i359.PaperlessApiService>()),
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
    gh.lazySingleton<_i1033.GetDocumentsUseCase>(
      () => _i1033.GetDocumentsUseCase(gh<_i822.DocumentRepository>()),
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
    gh.lazySingleton<_i608.EsclScanClient>(
      () => _i128.EsclScanClientImpl(
        gh<_i914.PaperlessHttpClientFactory>(),
        gh<_i168.EsclScanSettingsXmlBuilder>(),
      ),
    );
    gh.factory<_i887.UploadDocumentUseCase>(
      () => _i887.UploadDocumentUseCase(gh<_i175.PaperlessApiServiceImpl>()),
    );
    gh.factory<_i139.UploadCubit>(
      () => _i139.UploadCubit(
        gh<_i887.UploadDocumentUseCase>(),
        gh<_i175.PaperlessApiServiceImpl>(),
      ),
    );
    gh.factory<_i929.NetworkScanCubit>(
      () => _i929.NetworkScanCubit(
        gh<_i810.ScannerDiscoveryService>(),
        gh<_i608.EsclScanClient>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i135.AppModule {}

class _$NetworkModule extends _i550.NetworkModule {}
