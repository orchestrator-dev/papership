import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/discovered_scanner.dart';
import '../../../../domain/models/scanner_capabilities.dart';
import '../../../scan_session/bloc/scan_session_cubit.dart';
import '../bloc/network_scan_cubit.dart';
import '../bloc/network_scan_state.dart';
import 'manual_scanner_dialog.dart';
import 'scan_settings_panel.dart';

class NetworkScannerBottomSheet extends StatelessWidget {
  const NetworkScannerBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(
        value: context.read<ScanSessionCubit>(),
        child: BlocProvider<NetworkScanCubit>(
          create: (_) => GetIt.I<NetworkScanCubit>(),
          child: const NetworkScannerBottomSheet(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return BlocConsumer<NetworkScanCubit, NetworkScanState>(
          listener: (context, state) {
            state.maybeWhen(
              scanning: (_, pages) {
                // If we transition to scanning, maybe show a snackbar or just keep updating UI
              },
              error: (message, _) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $message')),
                );
              },
              discovered: (scanners) {
                // Done scanning? Or just back to list
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                _buildHeader(context, state),
                const Divider(height: 1),
                Expanded(
                  child: state.when(
                    discovering: (scanners) => _buildScannerList(context, scanners, scrollController, true),
                    discovered: (scanners) => _buildScannerList(context, scanners, scrollController, false),
                    selectingSettings: (scanner, _) => SingleChildScrollView(
                      controller: scrollController,
                      child: ScanSettingsPanel(scanner: scanner),
                    ),
                    scanning: (scanner, pageCount) => _buildScanningProgress(context, scanner, pageCount),
                    error: (message, scanner) => _buildError(context, message, scanner),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, NetworkScanState state) {
    final bool showBack = state.maybeMap(
      discovering: (_) => false,
      discovered: (_) => false,
      orElse: () => true,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          if (showBack)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.read<NetworkScanCubit>().backToScanners(),
            )
          else
            const SizedBox(width: 48), // Placeholder for alignment
          const Expanded(
            child: Text(
              'Choose Scanner',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (!showBack)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context.read<NetworkScanCubit>().refreshDiscovery(),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildScannerList(BuildContext context, List<DiscoveredScanner> scanners, ScrollController scrollController, bool isDiscovering) {
    return ListView(
      controller: scrollController,
      children: [
        if (isDiscovering && scanners.isEmpty)
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(child: CircularProgressIndicator()),
          ),
        for (final scanner in scanners)
          ListTile(
            leading: const Icon(Icons.print),
            title: Row(
              children: [
                Expanded(child: Text(scanner.displayName)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'eSCL',
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(scanner.host),
                if (scanner.capabilities == null)
                  const Row(
                    children: [
                      SizedBox(width: 12, height: 12, child: CircularProgressIndicator(strokeWidth: 2)),
                      SizedBox(width: 8),
                      Text('Fetching capabilities...'),
                    ],
                  )
                else
                  Text(_formatCapabilities(scanner.capabilities!)),
              ],
            ),
            onTap: scanner.capabilities == null
                ? null
                : () => context.read<NetworkScanCubit>().selectScanner(scanner),
          ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('Enter scanner IP manually'),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => const ManualScannerDialog(),
            );
          },
        ),
      ],
    );
  }

  String _formatCapabilities(ScannerCapabilities caps) {
    final sources = [];
    if (caps.inputSources.contains(InputSource.platen)) sources.add('Platen');
    if (caps.supportsAdf) sources.add('ADF');
    
    final maxDpi = caps.supportedResolutions.isNotEmpty
        ? caps.supportedResolutions.reduce((a, b) => a > b ? a : b)
        : 300;
        
    return '${sources.join(' | ')} | ${maxDpi}dpi';
  }

  Widget _buildScanningProgress(BuildContext context, DiscoveredScanner scanner, int pageCount) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          Text(
            'Scanning page ${pageCount + 1}...',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text('from ${scanner.displayName}'),
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, String message, DiscoveredScanner? scanner) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              'Scan Failed',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (scanner != null) {
                  context.read<NetworkScanCubit>().selectScanner(scanner);
                } else {
                  context.read<NetworkScanCubit>().backToScanners();
                }
              },
              child: const Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}
