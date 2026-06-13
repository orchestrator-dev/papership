import 'package:flutter/material.dart';
import '../../core/error/app_failure.dart';

class ErrorStateWidget extends StatelessWidget {
  final AppFailure failure;
  final VoidCallback? onRetry;

  const ErrorStateWidget({
    super.key,
    required this.failure,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.error;
    String title = "Error";
    String message = failure.map(
      network: (f) {
        icon = Icons.cloud_off;
        title = "Network Error";
        return f.message;
      },
      auth: (f) {
        icon = Icons.lock_outline;
        title = "Authentication Error";
        return f.message;
      },
      scanner: (f) {
        icon = Icons.print_disabled;
        title = "Scanner Error";
        return f.message;
      },
      parse: (f) {
        icon = Icons.error_outline;
        title = "Data Error";
        return f.message;
      },
      unknown: (f) {
        icon = Icons.warning_amber_rounded;
        title = "Unknown Error";
        return f.message;
      },
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text("Retry"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
