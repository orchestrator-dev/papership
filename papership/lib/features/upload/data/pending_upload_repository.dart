import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../models/pending_upload.dart';

abstract class PendingUploadRepository {
  Future<List<PendingUpload>> getPendingUploads();
  Future<void> savePendingUpload(PendingUpload upload);
  Future<void> removePendingUpload(String id);
  Future<void> clearAll();
}

@LazySingleton(as: PendingUploadRepository)
class PendingUploadRepositoryImpl implements PendingUploadRepository {
  final FlutterSecureStorage _storage;
  static const _key = 'pending_uploads';

  PendingUploadRepositoryImpl(this._storage);

  @override
  Future<List<PendingUpload>> getPendingUploads() async {
    final jsonStr = await _storage.read(key: _key);
    if (jsonStr == null || jsonStr.isEmpty) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(jsonStr);
      return jsonList.map((json) => PendingUpload.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> savePendingUpload(PendingUpload upload) async {
    final uploads = await getPendingUploads();
    final index = uploads.indexWhere((u) => u.id == upload.id);
    if (index >= 0) {
      uploads[index] = upload;
    } else {
      uploads.add(upload);
    }
    
    // Sort by createdAt
    uploads.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    
    final jsonStr = jsonEncode(uploads.map((u) => u.toJson()).toList());
    await _storage.write(key: _key, value: jsonStr);
  }

  @override
  Future<void> removePendingUpload(String id) async {
    final uploads = await getPendingUploads();
    uploads.removeWhere((u) => u.id == id);
    final jsonStr = jsonEncode(uploads.map((u) => u.toJson()).toList());
    await _storage.write(key: _key, value: jsonStr);
  }

  @override
  Future<void> clearAll() async {
    await _storage.delete(key: _key);
  }
}
