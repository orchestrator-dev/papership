import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:xml/xml.dart';
import '../../../core/error/app_failure.dart';
import '../../../core/utils/result.dart';
import '../../../domain/models/scanner_capabilities.dart';

class EsclCapabilitiesParser {
  final Dio _dio;

  EsclCapabilitiesParser({Dio? dio}) : _dio = dio ?? Dio();

  Future<Result<ScannerCapabilities>> fetchCapabilities(
      String host, int port, bool useTls, String esclRoot) async {
    try {
      final scheme = useTls ? 'https' : 'http';
      final url = '$scheme://$host:$port$esclRoot/ScannerCapabilities';
      final response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.plain,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      );

      return parseCapabilities(response.data.toString());
    } on DioException catch (e) {
      return Left(AppFailure.network(
          message: e.message ?? 'Network error fetching capabilities',
          statusCode: e.response?.statusCode));
    } catch (e) {
      return Left(AppFailure.network(message: e.toString()));
    }
  }

  Result<ScannerCapabilities> parseCapabilities(String xmlString) {
    try {
      final document = XmlDocument.parse(xmlString);
      final root = document.rootElement;

      // Make and Model
      final makeAndModel = _findText(root, 'pwg:MakeAndModel') ?? 'Unknown Scanner';
      final serialNumber = _findText(root, 'pwg:SerialNumber');
      final adminUri = _findText(root, 'scan:AdminURI');

      // Input Sources
      final inputSources = <InputSource>{};
      final platen = root.findAllElements('pwg:Platen').isNotEmpty;
      if (platen) {
        inputSources.add(InputSource.platen);
      }
      final adfElements = root.findAllElements('scan:Adf');
      final adf = adfElements.isNotEmpty;
      bool supportsAdf = adf;
      bool supportsDuplex = false;
      if (adf) {
        inputSources.add(InputSource.adfSimplex);
        final adfElement = adfElements.first;
        final duplexNode = _findText(adfElement, 'scan:AdfDuplexInputCaps') != null || 
                       _findText(adfElement, 'scan:Duplex') == 'true';
        if (duplexNode || adfElement.findAllElements('scan:AdfDuplexInputCaps').isNotEmpty) {
           inputSources.add(InputSource.adfDuplex);
           supportsDuplex = true;
        }
      } 
      
      // Also check if pwg:InputSource is explicitly defined in capabilities
      final sources = root.findAllElements('pwg:InputSource').map((e) => e.innerText).toList();
      if (sources.contains('Platen')) inputSources.add(InputSource.platen);
      if (sources.contains('Feeder')) {
        supportsAdf = true;
        inputSources.add(InputSource.adfSimplex);
      }
      
      if (inputSources.isEmpty) {
         inputSources.add(InputSource.platen); // Default fallback
      }

      // Color Modes
      final colorModes = <ColorMode>{};
      final colorModeElements = root.findAllElements('pwg:ColorMode');
      for (var e in colorModeElements) {
        final text = e.innerText;
        if (text == 'BlackAndWhite1') colorModes.add(ColorMode.blackAndWhite);
        if (text == 'Grayscale8') colorModes.add(ColorMode.grayscale);
        if (text == 'RGB24') colorModes.add(ColorMode.color);
      }
      if (colorModes.isEmpty) {
        colorModes.add(ColorMode.color); // fallback
      }

      // Resolutions
      final supportedResolutions = <int>{};
      final discreteResolutions = root.findAllElements('scan:DiscreteResolutions');
      for (var dr in discreteResolutions) {
         final xRes = dr.findAllElements('scan:XResolution');
         for (var x in xRes) {
            final res = int.tryParse(x.innerText);
            if (res != null) supportedResolutions.add(res);
         }
      }
      if (supportedResolutions.isEmpty) {
        final xRes = root.findAllElements('scan:XResolution');
        for (var x in xRes) {
          final res = int.tryParse(x.innerText);
          if (res != null) supportedResolutions.add(res);
        }
      }
      if (supportedResolutions.isEmpty) {
        supportedResolutions.addAll([150, 300]); // fallback
      }

      // Formats
      final supportedFormats = <DocumentFormat>{};
      final formatElements = root.findAllElements('pwg:DocumentFormat');
      for (var e in formatElements) {
        final text = e.innerText;
        if (text.contains('pdf')) supportedFormats.add(DocumentFormat.pdf);
        if (text.contains('jpeg')) supportedFormats.add(DocumentFormat.jpeg);
        if (text.contains('png')) supportedFormats.add(DocumentFormat.png);
      }
      if (supportedFormats.isEmpty) {
         supportedFormats.add(DocumentFormat.pdf);
      }
      
      DocumentFormat defaultFormat = supportedFormats.contains(DocumentFormat.pdf) 
          ? DocumentFormat.pdf 
          : supportedFormats.first;

      // Max Scan Region
      int maxWidth = 2550; // Default 8.5" at 300dpi
      int maxHeight = 3300; // Default 11" at 300dpi
      
      final maxWidthStr = _findText(root, 'scan:MaxWidth');
      if (maxWidthStr != null) {
        maxWidth = int.tryParse(maxWidthStr) ?? maxWidth;
      }
      final maxHeightStr = _findText(root, 'scan:MaxHeight');
      if (maxHeightStr != null) {
        maxHeight = int.tryParse(maxHeightStr) ?? maxHeight;
      }

      return Right(ScannerCapabilities(
        makeAndModel: makeAndModel,
        inputSources: inputSources.toList(),
        colorModes: colorModes.toList(),
        supportedResolutions: supportedResolutions.toList()..sort(),
        defaultFormat: defaultFormat,
        supportedFormats: supportedFormats.toList(),
        maxScanRegion: ScanRegion(width: maxWidth, height: maxHeight),
        supportsAdf: supportsAdf,
        supportsDuplex: supportsDuplex,
        serialNumber: serialNumber,
        adminUri: adminUri,
      ));
    } catch (e) {
      return Left(AppFailure.parse(message: 'Failed to parse capabilities XML: ${e.toString()}'));
    }
  }

  String? _findText(XmlElement root, String tag) {
    final elements = root.findAllElements(tag);
    if (elements.isNotEmpty) {
      return elements.first.innerText;
    }
    return null;
  }
}
