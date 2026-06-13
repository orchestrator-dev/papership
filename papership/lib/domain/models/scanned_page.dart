import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanned_page.freezed.dart';

enum ScannedPageSource { camera, network }

@freezed
abstract class ScannedPage with _$ScannedPage {
  const factory ScannedPage({
    required String id,
    required ScannedPageSource source,
    required Uint8List imageBytes,
    @Default(0) int rotationDegrees,
    @Default(false) bool excluded,
    String? thumbnailPath,
    double? enhancedContrast,
    double? brightnessAdjust,
  }) = _ScannedPage;
}
