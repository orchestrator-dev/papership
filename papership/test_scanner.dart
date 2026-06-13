// ignore_for_file: avoid_print
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:multicast_dns/multicast_dns.dart';

void main() async {
  print('Starting mDNS discovery...');
  final MDnsClient client = MDnsClient();
  await client.start();

  String? scannerIp;
  int? scannerPort;

  await for (final PtrResourceRecord ptr in client.lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer('_uscan._tcp.local'))) {
    await for (final SrvResourceRecord srv in client.lookup<SrvResourceRecord>(ResourceRecordQuery.service(ptr.domainName))) {
      await for (final IPAddressResourceRecord ip in client.lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv4(srv.target))) {
        print('Found scanner at ${ip.address.address}:${srv.port}');
        scannerIp = ip.address.address;
        scannerPort = srv.port;
        break;
      }
      if (scannerIp != null) break;
    }
    if (scannerIp != null) break;
  }
  
  // also check _scanner._tcp.local if not found
  if (scannerIp == null) {
      await for (final PtrResourceRecord ptr in client.lookup<PtrResourceRecord>(ResourceRecordQuery.serverPointer('_scanner._tcp.local'))) {
        await for (final SrvResourceRecord srv in client.lookup<SrvResourceRecord>(ResourceRecordQuery.service(ptr.domainName))) {
          await for (final IPAddressResourceRecord ip in client.lookup<IPAddressResourceRecord>(ResourceRecordQuery.addressIPv4(srv.target))) {
            print('Found scanner at ${ip.address.address}:${srv.port}');
            scannerIp = ip.address.address;
            scannerPort = srv.port;
            break;
          }
          if (scannerIp != null) break;
        }
        if (scannerIp != null) break;
      }
  }
  
  client.stop();

  if (scannerIp == null) {
    print('No scanner found!');
    return;
  }

  // eSCL Scan
  final dio = Dio();
  final esclRoot = 'http://$scannerIp:$scannerPort/eSCL';
  
  print('Creating ScanJob...');
  final scanXml = '''<?xml version="1.0" encoding="UTF-8"?>
<scan:ScanSettings xmlns:pwg="http://www.pwg.org/schemas/2010/12/sm" xmlns:scan="http://schemas.hp.com/imaging/escl/2011/05/03">
  <pwg:Version>2.0</pwg:Version>
  <scan:Intent>Document</scan:Intent>
  <pwg:InputSource>Platen</pwg:InputSource>
  <scan:ColorMode>RGB24</scan:ColorMode>
  <scan:DocumentFormat>image/jpeg</scan:DocumentFormat>
</scan:ScanSettings>''';

  String jobUrl = '';
  try {
    final response = await dio.post('$esclRoot/ScanJobs', data: scanXml, options: Options(headers: {'Content-Type': 'text/xml'}, validateStatus: (status) => true));
    
    if (response.statusCode == 201) {
        jobUrl = response.headers.value('Location') ?? '';
    } else {
        print('Error creating job: \${response.statusCode} \${response.data}');
        return;
    }
    
    if (jobUrl.isEmpty) {
        print('No Location header returned.');
        return;
    }
    
    if (!jobUrl.startsWith('http')) {
        jobUrl = 'http://$scannerIp:$scannerPort$jobUrl';
    }
    print('ScanJob created at $jobUrl');
  } catch(e) {
     print('Exception creating job: $e');
     return;
  }

  // Fetch NextDocument with retries
  print('Waiting 2 seconds for scanner to warm up...');
  await Future.delayed(Duration(seconds: 2));

  print('Fetching document...');
  int retries = 5;
  while(retries > 0) {
      try {
        final docResponse = await dio.get('$jobUrl/NextDocument', options: Options(responseType: ResponseType.bytes, validateStatus: (status) => true));
        if (docResponse.statusCode == 200) {
            final bytes = docResponse.data as List<int>;
            final file = File('scanned_image.jpg');
            await file.writeAsBytes(bytes);
            print('Success! Image saved to scanned_image.jpg');
            break;
        } else if (docResponse.statusCode == 503) {
            print('Scanner busy (503). Retrying in 2 seconds...');
            await Future.delayed(Duration(seconds: 2));
            retries--;
        } else {
            print('Failed to fetch doc. Status: \${docResponse.statusCode}');
            break;
        }
      } catch(e) {
        print('Error fetching document: $e');
        break;
      }
  }
}
