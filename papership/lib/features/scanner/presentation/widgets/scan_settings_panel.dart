import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/discovered_scanner.dart';
import '../../../../domain/models/scan_settings.dart';
import '../../../../domain/models/scanner_capabilities.dart';
import '../../../scan_session/bloc/scan_session_cubit.dart';
import '../bloc/network_scan_cubit.dart';

class ScanSettingsPanel extends StatefulWidget {
  final DiscoveredScanner scanner;

  const ScanSettingsPanel({super.key, required this.scanner});

  @override
  State<ScanSettingsPanel> createState() => _ScanSettingsPanelState();
}

class _ScanSettingsPanelState extends State<ScanSettingsPanel> {
  late InputSource _selectedSource;
  late int _selectedResolution;
  late ColorMode _selectedColorMode;
  late DocumentFormat _selectedFormat;

  @override
  void initState() {
    super.initState();
    final caps = widget.scanner.capabilities!;
    
    // Set defaults based on capabilities
    _selectedSource = caps.inputSources.contains(InputSource.adfSimplex) 
        ? InputSource.adfSimplex 
        : caps.inputSources.first;
        
    _selectedResolution = caps.supportedResolutions.contains(300) 
        ? 300 
        : caps.supportedResolutions.last;
        
    _selectedColorMode = caps.colorModes.contains(ColorMode.color) 
        ? ColorMode.color 
        : caps.colorModes.first;
        
    _selectedFormat = caps.supportedFormats.contains(DocumentFormat.pdf)
        ? DocumentFormat.pdf
        : caps.supportedFormats.first;
  }

  @override
  Widget build(BuildContext context) {
    final caps = widget.scanner.capabilities!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Source', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SegmentedButton<InputSource>(
            segments: [
              if (caps.inputSources.contains(InputSource.platen))
                const ButtonSegment(value: InputSource.platen, label: Text('Platen')),
              if (caps.inputSources.contains(InputSource.adfSimplex))
                const ButtonSegment(value: InputSource.adfSimplex, label: Text('ADF Simplex')),
              if (caps.inputSources.contains(InputSource.adfDuplex))
                const ButtonSegment(value: InputSource.adfDuplex, label: Text('ADF Duplex')),
            ],
            selected: {_selectedSource},
            onSelectionChanged: (Set<InputSource> newSelection) {
              setState(() {
                _selectedSource = newSelection.first;
              });
            },
          ),
          
          const SizedBox(height: 16),
          const Text('Resolution', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SegmentedButton<int>(
            segments: caps.supportedResolutions.map((res) {
              return ButtonSegment(value: res, label: Text('${res}dpi'));
            }).toList(),
            selected: {_selectedResolution},
            onSelectionChanged: (Set<int> newSelection) {
              setState(() {
                _selectedResolution = newSelection.first;
              });
            },
          ),

          const SizedBox(height: 16),
          const Text('Color Mode', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SegmentedButton<ColorMode>(
            segments: [
              if (caps.colorModes.contains(ColorMode.color))
                const ButtonSegment(value: ColorMode.color, label: Text('Color')),
              if (caps.colorModes.contains(ColorMode.grayscale))
                const ButtonSegment(value: ColorMode.grayscale, label: Text('Grayscale')),
              if (caps.colorModes.contains(ColorMode.blackAndWhite))
                const ButtonSegment(value: ColorMode.blackAndWhite, label: Text('B&W')),
            ],
            selected: {_selectedColorMode},
            onSelectionChanged: (Set<ColorMode> newSelection) {
              setState(() {
                _selectedColorMode = newSelection.first;
              });
            },
          ),

          const SizedBox(height: 16),
          const Text('Format', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SegmentedButton<DocumentFormat>(
            segments: [
              if (caps.supportedFormats.contains(DocumentFormat.pdf))
                const ButtonSegment(value: DocumentFormat.pdf, label: Text('PDF')),
              if (caps.supportedFormats.contains(DocumentFormat.jpeg))
                const ButtonSegment(value: DocumentFormat.jpeg, label: Text('JPEG')),
            ],
            selected: {_selectedFormat},
            onSelectionChanged: (Set<DocumentFormat> newSelection) {
              setState(() {
                _selectedFormat = newSelection.first;
              });
            },
          ),

          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              final settings = ScanSettings(
                inputSource: _selectedSource,
                colorMode: _selectedColorMode,
                resolution: _selectedResolution,
                format: _selectedFormat,
                duplex: _selectedSource == InputSource.adfDuplex,
              );
              final sessionCubit = context.read<ScanSessionCubit>();
              context.read<NetworkScanCubit>().startScan(settings, sessionCubit);
            },
            child: const Text('Start Scan', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
