import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../data/remote/services/paperless_api_service.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  PaperlessApiService getPaperlessApiService(Dio dio) => PaperlessApiService(dio);

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}
