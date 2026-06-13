import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/discovered_scanner.dart';
import '../../domain/repositories/manual_scanner_repository.dart';

@LazySingleton(as: ManualScannerRepository)
class SecureStorageManualScannerRepository implements ManualScannerRepository {
  final FlutterSecureStorage _storage;
  static const _key = 'manual_scanners';

  SecureStorageManualScannerRepository(this._storage);

  @override
  Future<List<DiscoveredScanner>> getManualScanners() async {
    final data = await _storage.read(key: _key);
    if (data == null || data.isEmpty) return [];
    
    try {
      final List<dynamic> jsonList = jsonDecode(data);
      return jsonList.map((e) => DiscoveredScanner.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> addManualScanner(DiscoveredScanner scanner) async {
    final scanners = await getManualScanners();
    final idx = scanners.indexWhere((s) => s.id == scanner.id);
    if (idx >= 0) {
      scanners[idx] = scanner;
    } else {
      scanners.add(scanner);
    }
    await _storage.write(key: _key, value: jsonEncode(scanners.map((e) => e.toJson()).toList()));
  }

  @override
  Future<void> removeManualScanner(String id) async {
    final scanners = await getManualScanners();
    scanners.removeWhere((s) => s.id == id);
    await _storage.write(key: _key, value: jsonEncode(scanners.map((e) => e.toJson()).toList()));
  }

  @override
  Future<DiscoveredScanner?> resolveManual(String host, int port, bool useTls) async {
    return DiscoveredScanner(
      id: 'manual:$host:$port',
      displayName: '$host:$port',
      host: host,
      port: port,
      useTls: useTls,
      esclRoot: '/eSCL',
      capabilities: null, // To be populated
    );
  }
}
