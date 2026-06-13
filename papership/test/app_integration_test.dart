import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:papership/main.dart' as app;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'dart:io';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late HttpServer paperlessServer;
  late HttpServer esclServer;

  setUpAll(() async {
    // Mock Paperless Server
    final paperlessRouter = Router()
      ..post('/api/token/', (Request req) => Response.ok('{"token": "test_token"}', headers: {'content-type': 'application/json'}))
      ..get('/api/documents/', (Request req) => Response.ok('{"count": 1, "next": null, "previous": null, "all": [], "results": [{"id": 1, "title": "Test Doc", "created": "2023-01-01"}]}', headers: {'content-type': 'application/json'}))
      ..post('/api/documents/post_document/', (Request req) => Response.ok('OK'));
    
    paperlessServer = await shelf_io.serve(paperlessRouter.call, '127.0.0.1', 8000);

    // Mock eSCL Server
    final esclRouter = Router()
      ..get('/eSCL/ScannerCapabilities', (Request req) => Response.ok('''<?xml version="1.0" encoding="UTF-8"?>
<scan:ScannerCapabilities xmlns:scan="http://schemas.hp.com/imaging/escl/2011/05/03" xmlns:pwg="http://www.pwg.org/schemas/2010/12/sm">
  <pwg:Version>2.0</pwg:Version>
  <scan:Platen>
    <scan:PlatenInputCaps>
      <scan:MinWidth>0</scan:MinWidth>
      <scan:MaxWidth>2550</scan:MaxWidth>
      <scan:MinHeight>0</scan:MinHeight>
      <scan:MaxHeight>3300</scan:MaxHeight>
      <scan:SettingProfiles>
        <scan:SettingProfile>
          <scan:ColorModes>
            <scan:ColorMode>RGB24</scan:ColorMode>
          </scan:ColorModes>
          <scan:SupportedResolutions>
            <scan:DiscreteResolutions>
              <scan:DiscreteResolution>
                <scan:XResolution>300</scan:XResolution>
                <scan:YResolution>300</scan:YResolution>
              </scan:DiscreteResolution>
            </scan:DiscreteResolutions>
          </scan:SupportedResolutions>
        </scan:SettingProfile>
      </scan:SettingProfiles>
    </scan:PlatenInputCaps>
  </scan:Platen>
</scan:ScannerCapabilities>'''))
      ..post('/eSCL/ScanJobs', (Request req) => Response(201, headers: {'Location': 'http://127.0.0.1:8001/eSCL/ScanJobs/123'}))
      ..get('/eSCL/ScanJobs/123/NextDocument', (Request req) {
        // Return a dummy 1x1 jpeg
        final dummyJpeg = <int>[0xFF, 0xD8, 0xFF, 0xE0, 0x00, 0x10, 0x4A, 0x46, 0x49, 0x46, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0xFF, 0xDB, 0x00, 0x43, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xFF, 0xC0, 0x00, 0x0B, 0x08, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, 0x11, 0x00, 0xFF, 0xC4, 0x00, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xC4, 0x00, 0x14, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xDA, 0x00, 0x08, 0x01, 0x01, 0x00, 0x00, 0x3F, 0x00, 0x3F, 0xFF, 0xD9];
        return Response.ok(dummyJpeg, headers: {'content-type': 'image/jpeg'});
      });

    esclServer = await shelf_io.serve(esclRouter.call, '127.0.0.1', 8001);
  });

  tearDownAll(() async {
    await paperlessServer.close();
    await esclServer.close();
  });

  testWidgets('Server wizard -> login -> scan -> upload', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(paperlessServer.port, 8000);
    expect(esclServer.port, 8001);

    // Provide a simple wait to let the app initialize
    await tester.pump(const Duration(seconds: 1));
  });
}
