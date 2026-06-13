import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class AppModule {
  @lazySingleton
  LocalAuthentication get localAuth => LocalAuthentication();

  @preResolve
  @lazySingleton
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();
}
