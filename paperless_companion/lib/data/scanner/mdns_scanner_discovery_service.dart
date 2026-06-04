import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:multicast_dns/multicast_dns.dart';
import '../../domain/models/discovered_scanner.dart';
import '../../domain/services/scanner_discovery_service.dart';
import 'escl/escl_capabilities_parser.dart';

@LazySingleton(as: ScannerDiscoveryService)
class MdnsScannerDiscoveryService implements ScannerDiscoveryService {
  final _scannersController = StreamController<List<DiscoveredScanner>>.broadcast();
  final List<DiscoveredScanner> _discoveredScanners = [];
  final Map<String, DateTime> _lastDiscovered = {};
  MDnsClient? clientOverride;
  MDnsClient? _client;
  bool _isDiscovering = false;
  final EsclCapabilitiesParser _parser = EsclCapabilitiesParser();

  MdnsScannerDiscoveryService();

  @override
  Stream<List<DiscoveredScanner>> get scanners => _scannersController.stream;

  @override
  Future<void> startDiscovery() async {
    if (_isDiscovering) return;
    _isDiscovering = true;
    _client = clientOverride ?? MDnsClient();
    await _client!.start();

    _discoverService('_uscan._tcp.local.', false);
    _discoverService('_uscans._tcp.local.', true);
    _discoverService('_scanner._tcp.local.', false);
  }

  final List<StreamSubscription> _subscriptions = [];

  void _discoverService(String serviceType, bool useTls) {
    if (_client == null) return;
    
    final ptrSub = _client!
        .lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer(serviceType))
        .listen((ptr) {
      if (!_isDiscovering) return;

      String srvName = ptr.domainName;
      
      final srvSub = _client!
          .lookup<SrvResourceRecord>(ResourceRecordQuery.service(srvName))
          .listen((srv) {
        if (!_isDiscovering) return;
        
        final txtSub = _client!
            .lookup<TxtResourceRecord>(ResourceRecordQuery.text(srvName))
            .listen((txt) {
          if (!_isDiscovering) return;
          
          final txtRecords = _parseTxt(txt.text);
          final uuid = txtRecords['uuid'] ?? txtRecords['UUID'];
          if (uuid != null) {
            final now = DateTime.now();
            if (_lastDiscovered.containsKey(uuid)) {
              if (now.difference(_lastDiscovered[uuid]!) < const Duration(seconds: 5)) {
                return; // Deduplicate within 5 seconds
              }
            }
            _lastDiscovered[uuid] = now;
          }

          final esclRoot = txtRecords['rs'] ?? txtRecords['RS'] ?? '/eSCL';
          final ty = txtRecords['ty'] ?? txtRecords['TY'] ?? 'Unknown Scanner';

          String displayName = ty;
          if (displayName == 'Unknown Scanner') {
             final namePart = srvName.replaceAll('.$serviceType', '');
             displayName = namePart;
          }

          // Resolve IP
          String targetHost = srv.target;
          
          // Try IPv4 first
          final ipSub = _client!
              .lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv4(targetHost))
              .listen((a) {
             _publishScanner(srvName, displayName, a.address.address, srv.port, useTls, esclRoot, uuid);
          });
          _subscriptions.add(ipSub);
          
          // Try IPv6
          final ipv6Sub = _client!
              .lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv6(targetHost))
              .listen((aaaa) {
             _publishScanner(srvName, displayName, aaaa.address.address, srv.port, useTls, esclRoot, uuid);
          });
          _subscriptions.add(ipv6Sub);

        });
        _subscriptions.add(txtSub);
      });
      _subscriptions.add(srvSub);
    });
    _subscriptions.add(ptrSub);
  }

  void _publishScanner(String srvName, String displayName, String host, int port, bool useTls, String esclRoot, String? uuid) async {
     DiscoveredScanner scanner = DiscoveredScanner(
        id: uuid ?? srvName,
        displayName: displayName,
        host: host,
        port: port,
        useTls: useTls,
        esclRoot: esclRoot,
        capabilities: null,
     );
     _addOrUpdateScanner(scanner);

     // Fetch capabilities asynchronously
     final result = await _parser.fetchCapabilities(host, port, useTls, esclRoot);
     result.match(
        (failure) {
           // On failure, keep it with null capabilities
           // You could optionally log the failure
        },
        (capabilities) {
           // On success, update the scanner with the capabilities
           scanner = scanner.copyWith(capabilities: capabilities);
           _addOrUpdateScanner(scanner);
        }
     );
  }

  Map<String, String> _parseTxt(String txt) {
    final Map<String, String> map = {};
    final parts = txt.split('\n');
    for (final part in parts) {
      final eqIdx = part.indexOf('=');
      if (eqIdx > 0) {
        map[part.substring(0, eqIdx)] = part.substring(eqIdx + 1);
      }
    }
    return map;
  }

  void _addOrUpdateScanner(DiscoveredScanner scanner) {
    final idx = _discoveredScanners.indexWhere((s) => s.id == scanner.id);
    if (idx >= 0) {
      _discoveredScanners[idx] = scanner;
    } else {
      _discoveredScanners.add(scanner);
    }
    _scannersController.add(List.unmodifiable(_discoveredScanners));
  }

  @override
  Future<void> stopDiscovery() async {
    _isDiscovering = false;
    _client?.stop();
    _client = null;
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    _subscriptions.clear();
  }
}
