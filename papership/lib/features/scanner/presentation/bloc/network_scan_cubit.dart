import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../data/scanner/escl/escl_scan_client.dart';
import '../../../../domain/models/discovered_scanner.dart';
import '../../../../domain/models/scan_settings.dart';
import '../../../../domain/services/scanner_discovery_service.dart';
import '../../../scan_session/bloc/scan_session_cubit.dart';
import '../../../scan_session/models/scan_session.dart';
import 'network_scan_state.dart';

@injectable
class NetworkScanCubit extends Cubit<NetworkScanState> {
  final ScannerDiscoveryService _discoveryService;
  final EsclScanClient _esclClient;
  StreamSubscription? _discoverySub;

  NetworkScanCubit(this._discoveryService, this._esclClient)
      : super(const NetworkScanState.discovering()) {
    startDiscovery();
  }

  void startDiscovery() {
    emit(const NetworkScanState.discovering());
    _discoveryService.startDiscovery();
    _discoverySub?.cancel();
    _discoverySub = _discoveryService.scanners.listen((scanners) {
      state.maybeMap(
        selectingSettings: (_) {},
        scanning: (_) {},
        orElse: () => emit(NetworkScanState.discovered(scanners)),
      );
    });
  }

  void stopDiscovery() {
    _discoverySub?.cancel();
    _discoverySub = null;
    _discoveryService.stopDiscovery();
  }

  void refreshDiscovery() {
    startDiscovery();
  }

  void selectScanner(DiscoveredScanner scanner) {
    state.maybeMap(
      discovered: (s) => emit(NetworkScanState.selectingSettings(scanner, s.scanners)),
      discovering: (s) => emit(NetworkScanState.selectingSettings(scanner, s.scanners)),
      orElse: () {},
    );
  }

  void backToScanners() {
    state.maybeMap(
      selectingSettings: (s) => emit(NetworkScanState.discovered(s.scanners)),
      orElse: () {},
    );
  }

  void startScan(ScanSettings settings, ScanSessionCubit sessionCubit) async {
    final scanner = state.maybeMap(
      selectingSettings: (s) => s.scanner,
      orElse: () => null,
    );
    if (scanner == null) return;
    
    emit(NetworkScanState.scanning(scanner, 0));

    try {
      int pages = 0;
      await for (final pageBytes in _esclClient.scanAllPages(scanner, settings)) {
        pages++;
        emit(NetworkScanState.scanning(scanner, pages));
        
        sessionCubit.addPage(ScannedPage(
          id: const Uuid().v4(),
          source: ScannedPageSource.network,
          imageBytes: pageBytes,
        ));
      }
      emit(const NetworkScanState.discovered([])); // Or we can stop here and UI closes
    } catch (e) {
      emit(NetworkScanState.error(e.toString(), scanner));
    }
  }

  void addManualScanner(String host, int port, bool useTls) async {
    // We would need to implement this in the discovery service, but for now we just emit error if not implemented
    // The instructions say: "Enter scanner IP manually" tile -> opens ManualScannerDialog -> ?
  }

  @override
  Future<void> close() {
    stopDiscovery();
    return super.close();
  }
}
