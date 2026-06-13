import '../models/discovered_scanner.dart';

abstract class ManualScannerRepository {
  Future<List<DiscoveredScanner>> getManualScanners();
  Future<void> addManualScanner(DiscoveredScanner scanner);
  Future<void> removeManualScanner(String id);
  Future<DiscoveredScanner?> resolveManual(String host, int port, bool useTls);
}
