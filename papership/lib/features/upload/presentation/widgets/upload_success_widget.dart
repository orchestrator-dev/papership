import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UploadSuccessWidget extends StatelessWidget {
  final VoidCallback? onViewInPaperless;

  const UploadSuccessWidget({
    super.key,
    this.onViewInPaperless,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets9.lottiefiles.com/packages/lf20_rc5d0f61.json', // Checkmark animation
            width: 150,
            height: 150,
            repeat: false,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.check_circle,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Upload Successful!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          if (onViewInPaperless != null) ...[
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onViewInPaperless,
              icon: const Icon(Icons.open_in_new),
              label: const Text('View in Paperless'),
            ),
          ],
        ],
      ),
    );
  }
}
