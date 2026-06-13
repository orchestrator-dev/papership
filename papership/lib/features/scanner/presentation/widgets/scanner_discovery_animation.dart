import 'package:flutter/material.dart';

class ScannerDiscoveryAnimation extends StatefulWidget {
  final double size;
  
  const ScannerDiscoveryAnimation({super.key, this.size = 150});

  @override
  State<ScannerDiscoveryAnimation> createState() => _ScannerDiscoveryAnimationState();
}

class _ScannerDiscoveryAnimationState extends State<ScannerDiscoveryAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _PulseCircle(controller: _controller, delay: 0.0),
          _PulseCircle(controller: _controller, delay: 0.33),
          _PulseCircle(controller: _controller, delay: 0.66),
          Icon(
            Icons.radar,
            size: widget.size * 0.3,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _PulseCircle extends StatelessWidget {
  final AnimationController controller;
  final double delay;

  const _PulseCircle({
    required this.controller,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = controller.value - delay;
        if (value < 0) value += 1.0;
        
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: 1.0 - value,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
