import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/app_failure.dart';
import '../../../core/utils/result.dart';

@injectable
class CameraScanService {
  Future<Result<Uint8List>> captureWithEdgeDetection() async {
    try {
      final pictures = await CunningDocumentScanner.getPictures();
      if (pictures != null && pictures.isNotEmpty) {
        final file = File(pictures.first);
        final bytes = await file.readAsBytes();
        return Right(bytes);
      } else {
        return const Left(AppFailure.unknown(message: 'User cancelled scan'));
      }
    } catch (e) {
      return Left(AppFailure.unknown(message: 'Scanner error: $e'));
    }
  }

  Future<Result<Uint8List>> captureRaw() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        return const Left(AppFailure.unknown(message: 'No cameras available'));
      }

      final controller = CameraController(
        cameras.first,
        ResolutionPreset.max,
        enableAudio: false,
      );

      await controller.initialize();

      final xFile = await controller.takePicture();
      final bytes = await xFile.readAsBytes();

      await controller.dispose();

      return Right(bytes);
    } catch (e) {
      return Left(AppFailure.unknown(message: 'Camera error: $e'));
    }
  }
}
