import 'package:flutter_test/flutter_test.dart';
import 'package:papership/data/scanner/escl/escl_scan_settings_xml_builder.dart';
import 'package:papership/domain/models/scan_settings.dart';
import 'package:papership/domain/models/scanner_capabilities.dart';
import 'package:xml/xml.dart';

void main() {
  late EsclScanSettingsXmlBuilder builder;

  setUp(() {
    builder = EsclScanSettingsXmlBuilder();
  });

  group('EsclScanSettingsXmlBuilder', () {
    test('builds valid XML with correct namespace prefixes', () {
      final settings = const ScanSettings(
        inputSource: InputSource.adfSimplex,
        colorMode: ColorMode.color,
        resolution: 300,
        format: DocumentFormat.pdf,
      );

      final capabilities = const ScannerCapabilities(
        makeAndModel: 'Test Scanner',
        inputSources: [InputSource.platen, InputSource.adfSimplex],
        colorModes: [ColorMode.color],
        supportedResolutions: [300],
        defaultFormat: DocumentFormat.pdf,
        supportedFormats: [DocumentFormat.pdf],
        maxScanRegion: ScanRegion(width: 2550, height: 3300),
        supportsAdf: true,
        supportsDuplex: false,
      );

      final xmlString = builder.build(settings, capabilities);

      // Verify it is valid XML by parsing it
      final document = XmlDocument.parse(xmlString);
      final root = document.rootElement;

      expect(root.name.qualified, 'scan:ScanSettings');
      expect(root.getAttribute('xmlns:pwg'), 'http://www.pwg.org/schemas/2010/12/sm');
      expect(root.getAttribute('xmlns:scan'), 'http://schemas.hp.com/imaging/escl/2011/05/03');

      expect(root.findAllElements('pwg:Version').first.innerText, '2.63');
      expect(root.findAllElements('scan:Intent').first.innerText, 'Document');
      expect(root.findAllElements('pwg:InputSource').first.innerText, 'Feeder');
      expect(root.findAllElements('scan:ColorMode').first.innerText, 'RGB24');
      expect(root.findAllElements('scan:XResolution').first.innerText, '300');
      expect(root.findAllElements('scan:YResolution').first.innerText, '300');
      expect(root.findAllElements('pwg:DocumentFormat').first.innerText, 'application/pdf');
      
      final scanRegion = root.findAllElements('pwg:ScanRegion').first;
      expect(scanRegion.findAllElements('pwg:Width').first.innerText, '2550');
      expect(scanRegion.findAllElements('pwg:Height').first.innerText, '3300');
      expect(scanRegion.findAllElements('pwg:ContentRegionUnits').first.innerText, 'escl:ThreeHundredthsOfInches');
    });
  });
}
