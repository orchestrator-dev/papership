import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'server_config.dart';

abstract class ServerConfigRepository {
  Future<List<ServerConfig>> getServers();
  Future<void> saveServer(ServerConfig config);
  Future<void> deleteServer(String id);
  Future<ServerConfig?> getActiveServer();
  Future<void> setActiveServer(String id);
}

@LazySingleton(as: ServerConfigRepository)
class ServerConfigRepositoryImpl implements ServerConfigRepository {
  final FlutterSecureStorage _storage;
  static const _serversKey = 'server_configs_list';
  static const _activeServerKey = 'active_server_id';

  ServerConfigRepositoryImpl(this._storage);

  @override
  Future<List<ServerConfig>> getServers() async {
    final serversJson = await _storage.read(key: _serversKey);
    if (serversJson == null || serversJson.isEmpty) {
      return [];
    }
    try {
      final List<dynamic> decoded = jsonDecode(serversJson);
      return decoded.map((e) => ServerConfig.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> saveServer(ServerConfig config) async {
    final servers = await getServers();
    final index = servers.indexWhere((s) => s.id == config.id);
    if (index >= 0) {
      servers[index] = config;
    } else {
      servers.add(config);
    }
    
    final encoded = jsonEncode(servers.map((e) => e.toJson()).toList());
    await _storage.write(key: _serversKey, value: encoded);
  }

  @override
  Future<void> deleteServer(String id) async {
    final servers = await getServers();
    servers.removeWhere((s) => s.id == id);
    
    final encoded = jsonEncode(servers.map((e) => e.toJson()).toList());
    await _storage.write(key: _serversKey, value: encoded);

    final activeId = await _storage.read(key: _activeServerKey);
    if (activeId == id) {
      if (servers.isNotEmpty) {
        await _storage.write(key: _activeServerKey, value: servers.first.id);
      } else {
        await _storage.delete(key: _activeServerKey);
      }
    }
  }

  @override
  Future<ServerConfig?> getActiveServer() async {
    final activeId = await _storage.read(key: _activeServerKey);
    if (activeId == null) return null;
    
    final servers = await getServers();
    try {
      return servers.firstWhere((s) => s.id == activeId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setActiveServer(String id) async {
    await _storage.write(key: _activeServerKey, value: id);
  }
}
