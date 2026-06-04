import '../models/discovered_scanner.dart';

abstract class ScannerDiscoveryService {
  Stream<List<DiscoveredScanner>> get scanners;
  Future<void> startDiscovery();
  Future<void> stopDiscovery();
}
