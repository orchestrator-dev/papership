import 'package:flutter/material.dart';

class AnimatedUploadButton extends StatefulWidget {
  final bool isUploading;
  final VoidCallback onPressed;
  final Widget child;

  const AnimatedUploadButton({
    super.key,
    required this.isUploading,
    required this.onPressed,
    required this.child,
  });

  @override
  State<AnimatedUploadButton> createState() => _AnimatedUploadButtonState();
}

class _AnimatedUploadButtonState extends State<AnimatedUploadButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    if (widget.isUploading) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(AnimatedUploadButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isUploading != oldWidget.isUploading) {
      if (widget.isUploading) {
        _controller.repeat();
      } else {
        _controller.stop();
        _controller.reset();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.isUploading)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + (_controller.value * 0.5),
                child: Opacity(
                  opacity: 1.0 - _controller.value,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
              );
            },
          ),
        ElevatedButton(
          onPressed: widget.isUploading ? null : widget.onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
          ),
          child: widget.isUploading 
              ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)) 
              : widget.child,
        ),
      ],
    );
  }
}
