import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/server_config_cubit.dart';
import '../bloc/server_config_state.dart';
import '../screens/server_list_screen.dart';

class MultiServerQuickSwitch extends StatelessWidget {
  const MultiServerQuickSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerConfigCubit, ServerConfigState>(
      builder: (context, state) {
        return state.maybeWhen(
          list: (configs, activeId) {
            if (configs.isEmpty) {
              return IconButton(
                icon: const Icon(Icons.dns),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ServerListScreen()));
                },
              );
            }
            final activeServer = configs.firstWhere((c) => c.id == activeId, orElse: () => configs.first);
            return PopupMenuButton<String>(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.circle, size: 10, color: Colors.green),
                  const SizedBox(width: 4),
                  Text(activeServer.displayName, style: const TextStyle(fontSize: 14)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
              onSelected: (value) {
                if (value == 'manage') {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ServerListScreen()));
                } else {
                  context.read<ServerConfigCubit>().setActiveServer(value);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  ...configs.map((config) => PopupMenuItem(
                    value: config.id,
                    child: Row(
                      children: [
                        if (config.id == activeId)
                          const Icon(Icons.check, size: 16)
                        else
                          const SizedBox(width: 16),
                        const SizedBox(width: 8),
                        Text(config.displayName),
                      ],
                    ),
                  )),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 'manage',
                    child: Row(
                      children: [
                        Icon(Icons.settings, size: 16),
                        SizedBox(width: 8),
                        Text('Manage Servers'),
                      ],
                    ),
                  ),
                ];
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
