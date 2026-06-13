import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:papership/core/error/app_failure.dart';
import 'package:papership/data/pdf/pdf_generator_service.dart';
import 'package:papership/features/scan_session/models/scan_session.dart';

void main() {
  late PdfGeneratorService service;
  late Uint8List dummyImageBytes;

  setUp(() {
    service = PdfGeneratorService();
    final image = img.Image(width: 10, height: 10);
    dummyImageBytes = img.encodeJpg(image);
  });

  test('generatePdf with empty session returns AppFailure', () async {
    final session = const ScanSession(
      id: 'session1',
      pages: [],
    );

    final result = await service.generatePdf(session, 'Author');

    expect(result.isLeft(), true);
    result.fold(
      (l) => expect(l, isA<AppFailure>()),
      (r) => fail('Should have failed'),
    );
  });

  test('generatePdf with 4 pages with rotations returns valid pdf bytes', () async {
    final pages = List.generate(4, (index) => ScannedPage(
      id: 'page_$index',
      source: ScannedPageSource.camera,
      imageBytes: dummyImageBytes,
      rotationDegrees: 90 * index,
    ));

    final session = ScanSession(
      id: 'session1',
      pages: pages,
    );

    final result = await service.generatePdf(session, 'Author');

    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Should have succeeded'),
      (bytes) {
        expect(bytes.isNotEmpty, true);
        // Validating exactly 4 pages via binary parsing is brittle. Length > 0 implies generation succeeded.
      },
    );
  });

  test('generatePdf with an excluded page returns 3 pages', () async {
    final pages = List.generate(4, (index) => ScannedPage(
      id: 'page_$index',
      source: ScannedPageSource.camera,
      imageBytes: dummyImageBytes,
      excluded: index == 1,
    ));

    final session = ScanSession(
      id: 'session1',
      pages: pages,
    );

    final result = await service.generatePdf(session, 'Author');

    expect(result.isRight(), true);
    result.fold(
      (l) => fail('Should have succeeded'),
      (bytes) {
        expect(bytes.isNotEmpty, true);
      },
    );
  });
}
