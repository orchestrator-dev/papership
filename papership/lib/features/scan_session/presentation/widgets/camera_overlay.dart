import 'package:flutter/material.dart';

class CameraOverlay extends StatefulWidget {
  const CameraOverlay({super.key});

  @override
  State<CameraOverlay> createState() => _CameraOverlayState();
}

class _CameraOverlayState extends State<CameraOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _CameraOverlayPainter(
            opacity: 0.5 + (_controller.value * 0.5),
          ),
          child: Container(),
        );
      },
    );
  }
}

class _CameraOverlayPainter extends CustomPainter {
  final double opacity;

  _CameraOverlayPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    // Vignette
    final rect = Offset.zero & size;
    final gradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [
        Colors.transparent,
        Colors.black.withValues(alpha: 0.6),
      ],
      stops: const [0.5, 1.0],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    // Corner brackets
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    const double length = 40;
    const double padding = 24;

    // Top Left
    canvas.drawPath(
      Path()
        ..moveTo(padding, padding + length)
        ..lineTo(padding, padding)
        ..lineTo(padding + length, padding),
      paint,
    );

    // Top Right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - padding - length, padding)
        ..lineTo(size.width - padding, padding)
        ..lineTo(size.width - padding, padding + length),
      paint,
    );

    // Bottom Left
    canvas.drawPath(
      Path()
        ..moveTo(padding, size.height - padding - length)
        ..lineTo(padding, size.height - padding)
        ..lineTo(padding + length, size.height - padding),
      paint,
    );

    // Bottom Right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - padding - length, size.height - padding)
        ..lineTo(size.width - padding, size.height - padding)
        ..lineTo(size.width - padding, size.height - padding - length),
      paint,
    );
  }

  @override
  bool shouldRepaint(_CameraOverlayPainter oldDelegate) {
    return oldDelegate.opacity != opacity;
  }
}
