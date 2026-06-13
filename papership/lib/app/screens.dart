import 'package:flutter/material.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('DocumentListScreen')));
}

class DocumentDetailScreen extends StatelessWidget {
  final String id;
  const DocumentDetailScreen({super.key, required this.id});
  @override Widget build(BuildContext context) => Scaffold(body: Center(child: Text('DocumentDetailScreen $id')));
}

class ScanSessionScreen extends StatelessWidget {
  const ScanSessionScreen({super.key});
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('ScanSessionScreen')));
}

class NetworkScannerScreen extends StatelessWidget {
  const NetworkScannerScreen({super.key});
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('NetworkScannerScreen')));
}

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('UploadScreen')));
}



class ServerConfigWizard extends StatelessWidget {
  const ServerConfigWizard({super.key});
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('ServerConfigWizard')));
}

class EditServerScreen extends StatelessWidget {
  final String id;
  const EditServerScreen({super.key, required this.id});
  @override Widget build(BuildContext context) => Scaffold(body: Center(child: Text('EditServerScreen $id')));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('LoginScreen')));
}
