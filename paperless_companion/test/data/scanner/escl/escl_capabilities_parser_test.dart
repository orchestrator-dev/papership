import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:paperless_companion/data/scanner/escl/escl_capabilities_parser.dart';
import 'package:paperless_companion/domain/models/scanner_capabilities.dart';
import 'package:paperless_companion/core/error/app_failure.dart';

void main() {
  late EsclCapabilitiesParser parser;

  setUp(() {
    parser = EsclCapabilitiesParser();
  });

  String getFixture(String name) {
    final file = File('test/fixtures/$name');
    return file.readAsStringSync();
  }

  group('EsclCapabilitiesParser', () {
    test('parses Canon TS7750i capabilities successfully', () {
      final xml = getFixture('canon_ts7750i_capabilities.xml');
      final result = parser.parseCapabilities(xml);

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('Should not fail'),
        (capabilities) {
          expect(capabilities.makeAndModel, 'Canon TS7750i series');
          expect(capabilities.serialNumber, 'ABCD123456');
          expect(capabilities.adminUri, 'http://192.168.1.10');
          expect(capabilities.inputSources, containsAll([InputSource.platen, InputSource.adfSimplex, InputSource.adfDuplex]));
          expect(capabilities.supportsAdf, isTrue);
          expect(capabilities.supportsDuplex, isTrue);
          expect(capabilities.colorModes, containsAll([ColorMode.blackAndWhite, ColorMode.grayscale, ColorMode.color]));
          expect(capabilities.supportedResolutions, containsAll([100, 200, 300]));
          expect(capabilities.supportedFormats, containsAll([DocumentFormat.pdf, DocumentFormat.jpeg]));
          expect(capabilities.defaultFormat, DocumentFormat.pdf);
          expect(capabilities.maxScanRegion.width, 2551);
          expect(capabilities.maxScanRegion.height, 3507);
        },
      );
    });

    test('parses HP capabilities successfully', () {
      final xml = getFixture('hp_capabilities.xml');
      final result = parser.parseCapabilities(xml);

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('Should not fail'),
        (capabilities) {
          expect(capabilities.makeAndModel, 'HP LaserJet MFP M234sdwe');
          expect(capabilities.inputSources, containsAll([InputSource.platen, InputSource.adfSimplex]));
          expect(capabilities.supportsAdf, isTrue);
          expect(capabilities.supportsDuplex, isFalse);
          expect(capabilities.colorModes, containsAll([ColorMode.blackAndWhite, ColorMode.grayscale]));
          expect(capabilities.supportedResolutions, containsAll([150, 300]));
        },
      );
    });

    test('parses Brother capabilities successfully', () {
      final xml = getFixture('brother_capabilities.xml');
      final result = parser.parseCapabilities(xml);

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('Should not fail'),
        (capabilities) {
          expect(capabilities.makeAndModel, 'Brother MFC-L2710DW series');
          expect(capabilities.inputSources, containsAll([InputSource.platen]));
          expect(capabilities.supportsAdf, isFalse);
          expect(capabilities.supportsDuplex, isFalse);
          expect(capabilities.colorModes, containsAll([ColorMode.blackAndWhite, ColorMode.grayscale, ColorMode.color]));
        },
      );
    });

    test('returns AppFailure.parse on malformed XML, does not throw', () {
      final xml = getFixture('malformed_capabilities.xml');
      final result = parser.parseCapabilities(xml);

      expect(result.isLeft(), isTrue);
      result.fold(
        (failure) {
           expect(failure is ParseFailure, isTrue);
        },
        (r) => fail('Should not succeed'),
      );
    });
  });
}
