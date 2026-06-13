import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image/image.dart' as img;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:injectable/injectable.dart';

import '../../core/error/app_failure.dart';
import '../../core/utils/result.dart';
import '../../features/scan_session/models/scan_session.dart';

@injectable
class PdfGeneratorService {
  Future<Result<Uint8List>> generatePdf(ScanSession session, String authorName) async {
    final pagesToProcess = session.pages.where((p) => !p.excluded).toList();
    if (pagesToProcess.isEmpty) {
      return const Left(AppFailure.unknown(message: 'No pages to generate PDF from'));
    }

    try {
      final pdfBytes = await compute(_processAndGeneratePdf, _PdfGenerationParams(
        pages: pagesToProcess,
        title: session.uploadTitle,
        author: authorName,
        createdDate: session.createdDate,
      ));
      return Right(pdfBytes);
    } catch (e) {
      return Left(AppFailure.unknown(message: 'Failed to generate PDF: $e'));
    }
  }
}

class _PdfGenerationParams {
  final List<ScannedPage> pages;
  final String? title;
  final String author;
  final DateTime? createdDate;

  _PdfGenerationParams({
    required this.pages,
    this.title,
    required this.author,
    this.createdDate,
  });
}

Future<Uint8List> _processAndGeneratePdf(_PdfGenerationParams params) async {
  final pdf = pw.Document(
    title: params.title,
    author: params.author,
  );

  for (final page in params.pages) {
    img.Image? image = img.decodeImage(page.imageBytes);
    if (image == null) continue;

    if (page.rotationDegrees != 0) {
      image = img.copyRotate(image, angle: page.rotationDegrees);
    }

    if (page.brightnessAdjust != null || page.enhancedContrast != null) {
      image = img.adjustColor(
        image,
        brightness: page.brightnessAdjust,
        contrast: page.enhancedContrast,
      );
    }
    
    final processedImageBytes = img.encodeJpg(image);
    final pdfImage = pw.MemoryImage(processedImageBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(pdfImage, fit: pw.BoxFit.contain),
          );
        },
      ),
    );
  }

  return await pdf.save();
}
