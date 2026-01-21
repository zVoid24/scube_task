import 'package:flutter/material.dart';

class ThermometerWidget extends StatelessWidget {
  final double temperature;
  final Color color;
  final double height;

  const ThermometerWidget({
    super.key,
    required this.temperature,
    required this.color,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height * 0.4, // Aspect ratio
      child: CustomPaint(
        painter: _ThermometerPainter(temperature: temperature, color: color),
      ),
    );
  }
}

class _ThermometerPainter extends CustomPainter {
  final double temperature;
  final Color color;

  _ThermometerPainter({required this.temperature, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Paint bgPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final double bulbRadius = size.width / 2;
    final double stemWidth = size.width * 0.5;
    final double stemHeight = size.height - bulbRadius * 2;

    // Draw Background (White)
    // Bulb
    canvas.drawCircle(
      Offset(size.width / 2, size.height - bulbRadius),
      bulbRadius - 1,
      bgPaint,
    );
    // Stem
    final RRect stemRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        (size.width - stemWidth) / 2,
        0,
        stemWidth,
        stemHeight + bulbRadius, // Overlap slightly
      ),
      Radius.circular(stemWidth / 2),
    );
    canvas.drawRRect(stemRect, bgPaint);

    // Calculate Fill Height based on temperature (0 to 50 scale for demo)
    // Min temp 0 -> Fill 0% of stem
    // Max temp 50 -> Fill 100% of stem
    final double clampedTemp = temperature.clamp(0, 50);
    final double fillPercentage = clampedTemp / 50;
    final double fillHeight = stemHeight * fillPercentage;

    // Draw Fill
    // Bulb Fill
    canvas.drawCircle(
      Offset(size.width / 2, size.height - bulbRadius),
      bulbRadius - 3, // Slightly smaller to keep border visible
      fillPaint,
    );

    // Stem Fill
    final Rect fillRect = Rect.fromLTWH(
      (size.width - stemWidth) / 2 + 2, // Inset
      stemHeight - fillHeight,
      stemWidth - 4, // Inset
      fillHeight + bulbRadius, // Connect to bulb
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(fillRect, Radius.circular(stemWidth / 2)),
      fillPaint,
    );

    // Draw Border
    // Stem Border
    canvas.drawRRect(stemRect, borderPaint);
    // Bulb Border (draw arc to merge with stem?)
    // Simpler: Just draw the shape again with stroke

    // To draw a nice merged shape, we can use Path
    final Path borderPath = Path();
    borderPath.addRRect(stemRect);
    borderPath.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height - bulbRadius),
        radius: bulbRadius,
      ),
    );
    canvas.drawPath(borderPath, borderPaint);

    // Draw ticks
    final Paint tickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    for (int i = 0; i < 5; i++) {
      double y = stemHeight * (i / 5) + 10;
      canvas.drawLine(
        Offset((size.width - stemWidth) / 2 - 2, y),
        Offset((size.width - stemWidth) / 2 + 4, y),
        tickPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
