import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';
import 'dart:io';

import '../../../../injection_container.dart';
import '../data/pending_upload_repository.dart';
import '../models/pending_upload.dart';

class PendingUploadsScreen extends StatefulWidget {
  const PendingUploadsScreen({super.key});

  @override
  State<PendingUploadsScreen> createState() => _PendingUploadsScreenState();
}

class _PendingUploadsScreenState extends State<PendingUploadsScreen> {
  final _repository = sl<PendingUploadRepository>();
  List<PendingUpload> _uploads = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUploads();
  }

  Future<void> _loadUploads() async {
    setState(() => _isLoading = true);
    final uploads = await _repository.getPendingUploads();
    setState(() {
      _uploads = uploads;
      _isLoading = false;
    });
  }

  Future<void> _deleteUpload(PendingUpload upload) async {
    await _repository.removePendingUpload(upload.id);
    try {
      final file = File(upload.pdfPath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {}
    _loadUploads();
  }

  Future<void> _uploadAllNow() async {
    Workmanager().registerOneOffTask(
      "com.papership.upload_task_manual",
      "com.papership.upload",
      constraints: Constraints(networkType: NetworkType.connected),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Upload started...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Uploads'),
        actions: [
          if (_uploads.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.cloud_upload),
              tooltip: 'Upload all now',
              onPressed: _uploadAllNow,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _uploads.isEmpty
              ? const Center(child: Text('No pending uploads'))
              : ListView.builder(
                  itemCount: _uploads.length,
                  itemBuilder: (context, index) {
                    final upload = _uploads[index];
                    final fileName = upload.pdfPath.split('/').last;
                    final queuedTime = DateFormat.yMMMd().add_jm().format(upload.createdAt);
                    
                    return Dismissible(
                      key: Key(upload.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => _deleteUpload(upload),
                      child: ListTile(
                        title: Text(upload.metadata.title ?? fileName),
                        subtitle: Text('Queued: $queuedTime\nRetries: ${upload.retryCount}'),
                        isThreeLine: true,
                        leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                      ),
                    );
                  },
                ),
    );
  }
}
