import 'dart:typed_data';
import 'package:injectable/injectable.dart';

import '../../core/utils/result.dart';
import '../../data/pdf/pdf_generator_service.dart';
import '../../features/scan_session/models/scan_session.dart';

@injectable
class GeneratePdfUseCase {
  final PdfGeneratorService _pdfGeneratorService;

  GeneratePdfUseCase(this._pdfGeneratorService);

  Future<Result<Uint8List>> call(ScanSession session, {String authorName = 'Papership'}) {
    return _pdfGeneratorService.generatePdf(session, authorName);
  }
}
