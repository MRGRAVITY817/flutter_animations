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
  @override
  void paint(Canvas canvas, Size size) {
    // draw red circle
    final Paint redCirclePaint = Paint()
      ..color = Colors.red.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      redCirclePaint,
    );

    // draw red arc
    final Paint redArcPaint = Paint()
      ..color = Colors.redAccent.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      -0.5 * pi,
      0.5 * pi,
      false,
      redArcPaint,
    );

    // draw green circle
    final Paint greenCirclePaint = Paint()
      ..color = Colors.limeAccent.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2.5,
      greenCirclePaint,
    );

    // draw green arc
    final Paint greenArcPaint = Paint()
      ..color = Colors.limeAccent.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2.5,
      ),
      -0.5 * pi,
      1.2 * pi,
      false,
      greenArcPaint,
    );

    // draw blue circle
    final Paint blueCirclePaint = Paint()
      ..color = Colors.cyanAccent.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 3.44,
      blueCirclePaint,
    );

    // draw blue arc
    final Paint blueArcPaint = Paint()
      ..color = Colors.cyanAccent.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 3.44,
      ),
      -0.5 * pi,
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
