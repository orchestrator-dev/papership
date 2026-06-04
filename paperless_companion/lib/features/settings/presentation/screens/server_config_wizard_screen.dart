import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/auth/server_config.dart';
import '../../../../core/auth/models/auth_strategy_type.dart';
import '../bloc/server_config_cubit.dart';
import '../bloc/server_config_state.dart';

class ServerConfigWizardScreen extends StatefulWidget {
  const ServerConfigWizardScreen({super.key});

  @override
  State<ServerConfigWizardScreen> createState() => _ServerConfigWizardScreenState();
}

class _ServerConfigWizardScreenState extends State<ServerConfigWizardScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  // Step 1
  final _urlController = TextEditingController();
  bool _isValidUrl = false;
  String? _latency;

  // Step 2
  AuthStrategyType _authType = AuthStrategyType.usernamePassword;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _tokenController = TextEditingController();
  final _oidcDiscoveryController = TextEditingController();
  final _oidcClientIdController = TextEditingController();
  final Map<String, String> _customHeaders = {};
  final _headerKeyController = TextEditingController();
  final _headerValController = TextEditingController();

  // Step 3
  bool _trustSelfSigned = false;
  String? _caCertPath;
  String? _clientCertPath;
  final _clientCertPasswordController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _urlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _tokenController.dispose();
    _oidcDiscoveryController.dispose();
    _oidcClientIdController.dispose();
    _headerKeyController.dispose();
    _headerValController.dispose();
    _clientCertPasswordController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 3) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Server'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(value: (_currentStep + 1) / 4),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() => _currentStep = index);
              },
              children: [
                _buildStep1Url(),
                _buildStep2Auth(),
                _buildStep3Tls(),
                _buildStep4Verify(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  TextButton(
                    onPressed: _prevStep,
                    child: const Text('Back'),
                  )
                else
                  const SizedBox.shrink(),
                if (_currentStep < 3)
                  ElevatedButton(
                    onPressed: _isValidUrl || _currentStep > 0 ? _nextStep : null,
                    child: const Text('Next'),
                  )
                else
                  ElevatedButton(
                    onPressed: _saveServer,
                    child: const Text('Save'),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStep1Url() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Server URL', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          TextFormField(
            controller: _urlController,
            decoration: const InputDecoration(
              labelText: 'Base URL',
              hintText: 'https://paperless.example.com',
              border: OutlineInputBorder(),
            ),
            onChanged: (val) {
              setState(() {
                _isValidUrl = Uri.tryParse(val)?.hasScheme == true;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.network_check),
            label: const Text('Test Connection'),
            onPressed: _isValidUrl ? () async {
              context.read<ServerConfigCubit>().testConnection(_urlController.text);
            } : null,
          ),
          BlocConsumer<ServerConfigCubit, ServerConfigState>(
            listener: (context, state) {
              state.maybeWhen(
                testResult: (success, error) {
                  if (_currentStep == 0) {
                    setState(() {
                      _latency = success ? 'Success' : 'Error: $error';
                    });
                  }
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                testing: () => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
                orElse: () => _latency != null ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_latency!),
                ) : const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStep2Auth() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Authentication', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          DropdownButtonFormField<AuthStrategyType>(
            initialValue: _authType,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: AuthStrategyType.usernamePassword, child: Text('Username / Password')),
              DropdownMenuItem(value: AuthStrategyType.apiToken, child: Text('API Token')),
              DropdownMenuItem(value: AuthStrategyType.oidc, child: Text('OIDC / SSO')),
              DropdownMenuItem(value: AuthStrategyType.customHeaders, child: Text('Custom Headers')),
              DropdownMenuItem(value: AuthStrategyType.mtls, child: Text('Mutual TLS')),
            ],
            onChanged: (val) {
              if (val != null) setState(() => _authType = val);
            },
          ),
          const SizedBox(height: 24),
          if (_authType == AuthStrategyType.usernamePassword) ...[
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
          ] else if (_authType == AuthStrategyType.apiToken) ...[
            TextFormField(
              controller: _tokenController,
              decoration: const InputDecoration(labelText: 'API Token', border: OutlineInputBorder()),
            ),
          ] else if (_authType == AuthStrategyType.oidc) ...[
            TextFormField(
              controller: _oidcDiscoveryController,
              decoration: const InputDecoration(labelText: 'Discovery URL', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _oidcClientIdController,
              decoration: const InputDecoration(labelText: 'Client ID', border: OutlineInputBorder()),
            ),
          ] else if (_authType == AuthStrategyType.customHeaders) ...[
            Row(
              children: [
                Expanded(child: TextFormField(controller: _headerKeyController, decoration: const InputDecoration(labelText: 'Key'))),
                const SizedBox(width: 8),
                Expanded(child: TextFormField(controller: _headerValController, decoration: const InputDecoration(labelText: 'Value'))),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_headerKeyController.text.isNotEmpty) {
                      setState(() {
                        _customHeaders[_headerKeyController.text] = _headerValController.text;
                        _headerKeyController.clear();
                        _headerValController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
            ..._customHeaders.entries.map((e) => ListTile(
              title: Text(e.key),
              subtitle: Text(e.value),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _customHeaders.remove(e.key);
                  });
                },
              ),
            ))
          ] else if (_authType == AuthStrategyType.mtls) ...[
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['p12', 'pfx'],
                );
                if (result != null) {
                  setState(() => _clientCertPath = result.files.single.path);
                }
              },
              child: const Text('Select Client Certificate (.p12/.pfx)'),
            ),
            if (_clientCertPath != null) Text('Selected: $_clientCertPath'),
            const SizedBox(height: 16),
            TextFormField(
              controller: _clientCertPasswordController,
              decoration: const InputDecoration(labelText: 'Certificate Password (Optional)', border: OutlineInputBorder()),
              obscureText: true,
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildStep3Tls() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('TLS Options', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Trust self-signed certificates'),
            value: _trustSelfSigned,
            onChanged: (val) => setState(() => _trustSelfSigned = val),
          ),
          if (_trustSelfSigned)
            const Chip(
              label: Text('Warning: Reduced Security'),
              backgroundColor: Colors.orange,
            ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['crt', 'pem'],
              );
              if (result != null) {
                setState(() => _caCertPath = result.files.single.path);
              }
            },
            child: const Text('Import CA Certificate'),
          ),
          if (_caCertPath != null) Text('Selected CA: $_caCertPath'),
          if (_authType != AuthStrategyType.mtls) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['p12', 'pfx'],
                );
                if (result != null) {
                  setState(() => _clientCertPath = result.files.single.path);
                }
              },
              child: const Text('Import Client Certificate'),
            ),
            if (_clientCertPath != null) Text('Selected Client Cert: $_clientCertPath'),
            if (_clientCertPath != null) ...[
              const SizedBox(height: 8),
              TextFormField(
                controller: _clientCertPasswordController,
                decoration: const InputDecoration(labelText: 'Certificate Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
            ]
          ]
        ],
      ),
    );
  }

  Widget _buildStep4Verify() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BlocBuilder<ServerConfigCubit, ServerConfigState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Verify & Save', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              state.maybeWhen(
                testing: () => const Center(child: CircularProgressIndicator()),
                testResult: (success, error) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(success ? Icons.check_circle : Icons.error, color: success ? Colors.green : Colors.red),
                      title: Text(success ? 'Connection Successful' : 'Connection Failed'),
                      subtitle: error != null ? Text(error) : null,
                    ),
                  ],
                ),
                saving: () => const Center(child: CircularProgressIndicator()),
                orElse: () => const Text('Ready to test and save configuration.'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _saveServer() {
    final config = ServerConfig(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      displayName: _urlController.text.replaceAll('https://', '').replaceAll('http://', ''),
      baseUrl: _urlController.text,
      authType: _authType,
      trustSelfSigned: _trustSelfSigned,
      caCertPath: _caCertPath,
      clientCertPath: _clientCertPath,
      clientCertPassword: _clientCertPasswordController.text.isNotEmpty ? _clientCertPasswordController.text : null,
      customHeaders: _customHeaders.isNotEmpty ? _customHeaders : null,
      oidcDiscoveryUrl: _oidcDiscoveryController.text.isNotEmpty ? _oidcDiscoveryController.text : null,
      oidcClientId: _oidcClientIdController.text.isNotEmpty ? _oidcClientIdController.text : null,
    );
    context.read<ServerConfigCubit>().testAndSaveServer(config).then((_) {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }
}
