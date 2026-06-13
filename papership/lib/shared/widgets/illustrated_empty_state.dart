import 'package:flutter/material.dart';

class IllustratedEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;

  const IllustratedEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
  });

  factory IllustratedEmptyState.documents({Widget? action}) {
    return IllustratedEmptyState(
      icon: Icons.inbox_outlined,
      title: 'No documents yet',
      subtitle: 'Scan or upload a document to get started.',
      action: action,
    );
  }

  factory IllustratedEmptyState.search() {
    return const IllustratedEmptyState(
      icon: Icons.search_off_outlined,
      title: 'Nothing found',
      subtitle: 'Try adjusting your search or filters.',
    );
  }

  factory IllustratedEmptyState.noScanners({Widget? action}) {
    return IllustratedEmptyState(
      icon: Icons.wifi_off_outlined,
      title: 'No scanners found on network',
      subtitle: 'Make sure your scanner is turned on and connected to the same Wi-Fi network.',
      action: action,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 80,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 24),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
