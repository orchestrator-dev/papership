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
    return this;
  }
}

class _$NetworkModule extends _i550.NetworkModule {}
