import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatelessWidget {
  const AppleWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Watch"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: CustomPaint(
          // Creates 400 x 400 canvas
          size: const Size(300, 300),
          painter: AppleWatchPainter(),
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  static const strokeWidth = 22.0;
  static const startingAngle = -0.5 * pi;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Red (accent color of Apple Watch)
    const redColor = Color(0xFFFD2D55);
    final redCircleRadius = size.width / 2;
    // draw red circle
    final Paint redCirclePaint = Paint()
      ..color = redColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), redCircleRadius,
        redCirclePaint);

    // draw red arc
    final Paint redArcPaint = Paint()
      ..color = redColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: redCircleRadius,
      ),
      startingAngle,
      0.5 * pi,
      false,
      redArcPaint,
    );

    // Green
    const greenColor = Colors.limeAccent;
    final greenCircleRadius = size.width / 2.5;

    // draw green circle
    final Paint greenCirclePaint = Paint()
      ..color = greenColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, greenCircleRadius, greenCirclePaint);

    // draw green arc
    final Paint greenArcPaint = Paint()
      ..color = greenColor.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: greenCircleRadius,
      ),
      startingAngle,
      1.2 * pi,
      false,
      greenArcPaint,
    );

    // Blue
    final blueCircleRadius = size.width / 3.44;
    const blueColor = Colors.cyanAccent;

    // draw blue circle
    final Paint blueCirclePaint = Paint()
      ..color = blueColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, blueCircleRadius, blueCirclePaint);

    // draw blue arc
    final Paint blueArcPaint = Paint()
      ..color = blueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: blueCircleRadius,
      ),
      startingAngle,
      1.6 * pi,
      false,
      blueArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
