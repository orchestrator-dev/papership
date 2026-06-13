import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/network_scan_cubit.dart';

class ManualScannerDialog extends StatefulWidget {
  const ManualScannerDialog({super.key});

  @override
  State<ManualScannerDialog> createState() => _ManualScannerDialogState();
}

class _ManualScannerDialogState extends State<ManualScannerDialog> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController(text: '80');
  bool _useTls = false;

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter scanner IP manually'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _hostController,
            decoration: const InputDecoration(
              labelText: 'Host / IP Address',
              hintText: 'e.g. 192.168.1.50',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _portController,
            decoration: const InputDecoration(
              labelText: 'Port',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Use TLS (HTTPS)'),
            value: _useTls,
            onChanged: (val) {
              setState(() {
                _useTls = val;
                if (_portController.text == '80' && val) {
                  _portController.text = '443';
                } else if (_portController.text == '443' && !val) {
                  _portController.text = '80';
                }
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final host = _hostController.text.trim();
            final port = int.tryParse(_portController.text.trim()) ?? (_useTls ? 443 : 80);
            context.read<NetworkScanCubit>().addManualScanner(host, port, _useTls);
            Navigator.of(context).pop();
          },
          child: const Text('Connect'),
        ),
      ],
    );
  }
}
