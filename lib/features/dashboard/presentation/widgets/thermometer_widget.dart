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
      width: height * 0.4,
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

    canvas.drawCircle(
      Offset(size.width / 2, size.height - bulbRadius),
      bulbRadius - 1,
      bgPaint,
    );

    final RRect stemRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        (size.width - stemWidth) / 2,
        0,
        stemWidth,
        stemHeight + bulbRadius,
      ),
      Radius.circular(stemWidth / 2),
    );
    canvas.drawRRect(stemRect, bgPaint);
    final double clampedTemp = temperature.clamp(0, 50);
    final double fillPercentage = clampedTemp / 50;
    final double fillHeight = stemHeight * fillPercentage;
    canvas.drawCircle(
      Offset(size.width / 2, size.height - bulbRadius),
      bulbRadius - 3,
      fillPaint,
    );
    final Rect fillRect = Rect.fromLTWH(
      (size.width - stemWidth) / 2 + 2,
      stemHeight - fillHeight,
      stemWidth - 4,
      fillHeight + bulbRadius,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(fillRect, Radius.circular(stemWidth / 2)),
      fillPaint,
    );
    canvas.drawRRect(stemRect, borderPaint);
    final Path borderPath = Path();
    borderPath.addRRect(stemRect);
    borderPath.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height - bulbRadius),
        radius: bulbRadius,
      ),
    );
    canvas.drawPath(borderPath, borderPaint);
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
