import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import '../../injection_container.dart';
import '../../features/upload/data/pending_upload_repository.dart';
import '../../domain/usecases/upload_document_usecase.dart';
import '../../features/upload/models/pending_upload.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == "com.papership.upload") {
      configureDependencies(); 
      final repository = sl<PendingUploadRepository>();
      final uploadUseCase = sl<UploadDocumentUseCase>();
      
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
          
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);
      await flutterLocalNotificationsPlugin.initialize(settings: initializationSettings);

      final pendingUploads = await repository.getPendingUploads();
      
      bool success = true;

      for (var upload in pendingUploads) {
        try {
          final file = File(upload.pdfPath);
          if (!await file.exists()) {
            await repository.removePendingUpload(upload.id);
            continue;
          }
          
          final bytes = await file.readAsBytes();
          
          DateTime? createdDate;
          if (upload.metadata.createdDate != null) {
            createdDate = DateTime.tryParse(upload.metadata.createdDate!);
          }
          
          final request = UploadRequest(
            pdfBytes: bytes,
            title: upload.metadata.title ?? 'Untitled',
            tagIds: upload.metadata.tags,
            correspondentId: upload.metadata.correspondentId,
            documentTypeId: upload.metadata.documentTypeId,
            createdDate: createdDate,
            asn: upload.metadata.asn,
          );
          
          final result = await uploadUseCase(request);
          
          if (result.isRight()) {
            await repository.removePendingUpload(upload.id);
            await file.delete();
            await _showNotification(
              flutterLocalNotificationsPlugin,
              'Upload Successful',
              'Document uploaded: ${request.title}',
            );
          } else {
            await _handleFailure(upload, repository, flutterLocalNotificationsPlugin, request.title);
            success = false;
          }
        } catch (e) {
           await _handleFailure(upload, repository, flutterLocalNotificationsPlugin, upload.metadata.title ?? 'Untitled');
           success = false;
        }
      }
      return success;
    }
    return true;
  });
}

Future<void> _handleFailure(PendingUpload upload, PendingUploadRepository repository, FlutterLocalNotificationsPlugin notifications, String title) async {
  if (upload.retryCount >= 4) {
    // Max retries reached (5th attempt failed)
    await repository.removePendingUpload(upload.id); // Or mark as failed and keep it? Instructions say "mark as failed and notify user". Let's update retryCount = 5 to mark as failed. Wait, "remove on success, increment retryCount on failure. Max retries: 5; after 5 failures mark as failed and notify user."
    final updatedUpload = upload.copyWith(retryCount: 5);
    await repository.savePendingUpload(updatedUpload);
    await _showNotification(
      notifications,
      'Upload Failed',
      'Upload failed: $title — tap to retry',
    );
  } else {
    final updatedUpload = upload.copyWith(retryCount: upload.retryCount + 1);
    await repository.savePendingUpload(updatedUpload);
  }
}

Future<void> _showNotification(FlutterLocalNotificationsPlugin plugin, String title, String body) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'upload_channel',
    'Background Uploads',
    channelDescription: 'Notifications for background document uploads',
    importance: Importance.high,
    priority: Priority.high,
  );
  const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);
  await plugin.show(id: DateTime.now().millisecond, title: title, body: body, notificationDetails: platformDetails);
}
