import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_session.freezed.dart';

enum ScanSessionStatus { idle, scanning, error, saving, generatingPdf, pdfReady }

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

@freezed
abstract class ScanSession with _$ScanSession {
  const factory ScanSession({
    required String id,
    required List<ScannedPage> pages,
    @Default(ScanSessionStatus.idle) ScanSessionStatus status,
    String? uploadTitle,
    List<int>? tagIds,
    int? correspondentId,
    int? documentTypeId,
    DateTime? createdDate,
    String? storagePath,
    String? asn,
    String? selectedPageId,
    @JsonKey(includeFromJson: false, includeToJson: false) Uint8List? generatedPdfBytes,
  }) = _ScanSession;
}
