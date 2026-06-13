import 'package:xml/xml.dart';
import '../../../domain/models/scan_settings.dart';
import '../../../domain/models/scanner_capabilities.dart';

class EsclScanSettingsXmlBuilder {
  String build(ScanSettings settings, ScannerCapabilities capabilities) {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    
    builder.element('scan:ScanSettings', namespaces: {
      'http://www.pwg.org/schemas/2010/12/sm': 'pwg',
      'http://schemas.hp.com/imaging/escl/2011/05/03': 'scan',
    }, nest: () {
      builder.element('pwg:Version', nest: '2.63');
      builder.element('scan:Intent', nest: 'Document');
      
      builder.element('pwg:ScanRegions', nest: () {
        builder.element('pwg:ScanRegion', nest: () {
          builder.element('pwg:XOffset', nest: '0');
          builder.element('pwg:YOffset', nest: '0');
          
          final width = settings.scanRegion?.width ?? capabilities.maxScanRegion.width;
          final height = settings.scanRegion?.height ?? capabilities.maxScanRegion.height;
          
          builder.element('pwg:Width', nest: width.toString());
          builder.element('pwg:Height', nest: height.toString());
          builder.element('pwg:ContentRegionUnits', nest: 'escl:ThreeHundredthsOfInches');
        });
      });
      
      String inputSourceStr = 'Platen';
      if (settings.inputSource == InputSource.adfSimplex || settings.inputSource == InputSource.adfDuplex) {
        inputSourceStr = 'Feeder';
      }
      builder.element('pwg:InputSource', nest: inputSourceStr);
      
      String colorModeStr = 'RGB24';
      switch (settings.colorMode) {
        case ColorMode.blackAndWhite:
          colorModeStr = 'BlackAndWhite1';
          break;
        case ColorMode.grayscale:
          colorModeStr = 'Grayscale8';
          break;
        case ColorMode.color:
          colorModeStr = 'RGB24';
          break;
      }
      builder.element('scan:ColorMode', nest: colorModeStr);
      
      builder.element('scan:XResolution', nest: settings.resolution.toString());
      builder.element('scan:YResolution', nest: settings.resolution.toString());
      
      String mimeType = 'application/pdf';
      switch (settings.format) {
        case DocumentFormat.pdf:
          mimeType = 'application/pdf';
          break;
        case DocumentFormat.jpeg:
          mimeType = 'image/jpeg';
          break;
        case DocumentFormat.png:
          mimeType = 'image/png';
          break;
      }
      builder.element('pwg:DocumentFormat', nest: mimeType);
      
      if (settings.inputSource == InputSource.adfDuplex || settings.duplex) {
         builder.element('scan:Duplex', nest: 'true');
      }
    });

    return builder.buildDocument().toXmlString(pretty: true);
  }
}
