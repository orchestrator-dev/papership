import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/server_config_cubit.dart';
import '../bloc/server_config_state.dart';
import 'server_config_wizard_screen.dart';

class ServerListScreen extends StatelessWidget {
  const ServerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servers'),
      ),
      body: BlocBuilder<ServerConfigCubit, ServerConfigState>(
        builder: (context, state) {
          return state.maybeWhen(
            list: (configs, activeId) {
              if (configs.isEmpty) {
                return const Center(child: Text('No servers configured.'));
              }
              return ListView.builder(
                itemCount: configs.length,
                itemBuilder: (context, index) {
                  final config = configs[index];
                  final isActive = config.id == activeId;
                  return Dismissible(
                    key: Key(config.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      context.read<ServerConfigCubit>().deleteServer(config.id);
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(config.displayName),
                      subtitle: Text(config.baseUrl),
                      trailing: isActive ? const Icon(Icons.check_circle, color: Colors.green) : null,
                      onTap: () {
                        // Could navigate to EditServerScreen if we had one
                        // For now, set as active
                        context.read<ServerConfigCubit>().setActiveServer(config.id);
                      },
                    ),
                  );
                },
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ServerConfigWizardScreen()));
        },
      ),
    );
  }
}
