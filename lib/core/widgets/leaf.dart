import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// A single decorative leaf (the sage / terracotta leaves in the mockups).
/// Place a few inside a Stack with Positioned.
class Leaf extends StatelessWidget {
  const Leaf({
    super.key,
    this.width = 60,
    this.height = 140,
    this.color = AppColors.sage,
    this.opacity = 0.55,
    this.angle = 0,
  });

  final double width;
  final double height;
  final Color color;
  final double opacity;

  /// Rotation in radians.
  final double angle;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Transform.rotate(
        angle: angle,
        child: CustomPaint(
          size: Size(width, height),
          painter: _LeafPainter(color.withAlpha((opacity * 255).round())),
        ),
      ),
    );
  }
}

class _LeafPainter extends CustomPainter {
  _LeafPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final leaf = Path()
      ..moveTo(w / 2, h)
      ..cubicTo(w * 1.1, h * 0.72, w * 1.0, h * 0.22, w / 2, 0)
      ..cubicTo(0, h * 0.22, -w * 0.1, h * 0.72, w / 2, h)
      ..close();
    canvas.drawPath(leaf, Paint()..color = color);

    final rib = Path()
      ..moveTo(w / 2, h)
      ..quadraticBezierTo(w * 0.56, h * 0.5, w / 2, h * 0.08);
    canvas.drawPath(
      rib,
      Paint()
        ..color = Colors.white.withAlpha(70)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }

  @override
  bool shouldRepaint(covariant _LeafPainter oldDelegate) =>
      oldDelegate.color != color;
}
