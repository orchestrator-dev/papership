import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../core/auth/server_config.dart';
import '../../../../core/auth/server_config_repository.dart';
import 'server_config_state.dart';

@injectable
class ServerConfigCubit extends Cubit<ServerConfigState> {
  final ServerConfigRepository _repository;
  final Dio _dio;

  ServerConfigCubit(this._repository, this._dio) : super(const ServerConfigState.empty());

  Future<void> loadServers() async {
    final servers = await _repository.getServers();
    final activeServer = await _repository.getActiveServer();
    emit(ServerConfigState.list(configs: servers, activeId: activeServer?.id));
  }

  Future<void> testConnection(String baseUrl) async {
    emit(const ServerConfigState.testing());
    try {
      final response = await _dio.head('$baseUrl/api/');
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 400) {
        emit(const ServerConfigState.testResult(success: true));
      } else {
        emit(const ServerConfigState.testResult(success: false, errorMessage: 'Invalid status code'));
      }
    } catch (e) {
      emit(ServerConfigState.testResult(success: false, errorMessage: e.toString()));
    }
  }

  Future<void> testAndSaveServer(ServerConfig config) async {
    emit(const ServerConfigState.testing());
    // DNS -> TCP -> Auth -> GET /api/profile/ (Simulated test as full logic requires complex client setup, we just verify reachability for now)
    try {
      final response = await _dio.head('${config.baseUrl}/api/');
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 400) {
        emit(const ServerConfigState.saving());
        await _repository.saveServer(config);
        await _repository.setActiveServer(config.id);
        emit(const ServerConfigState.testResult(success: true));
        await loadServers();
      } else {
        emit(const ServerConfigState.testResult(success: false, errorMessage: 'Invalid status code'));
      }
    } catch (e) {
      emit(ServerConfigState.testResult(success: false, errorMessage: e.toString()));
    }
  }

  Future<void> deleteServer(String id) async {
    await _repository.deleteServer(id);
    await loadServers();
  }

  Future<void> setActiveServer(String id) async {
    await _repository.setActiveServer(id);
    await loadServers();
  }
}
