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
          size: const Size(400, 400),
          painter: AppleWatchPainter(),
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rectPaint = Paint()
      ..color = Colors.teal.shade200
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, rectPaint);

    final circlePaint = Paint()
      ..color = Colors.pink.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
