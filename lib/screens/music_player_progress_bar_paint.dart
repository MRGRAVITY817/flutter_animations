import 'package:flutter/material.dart';

class MusicPlayerProgressBarPaint extends CustomPainter {
  final double progressValue;

  const MusicPlayerProgressBarPaint({
    required this.progressValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final progress = size.width * progressValue;

    // Track
    final trackPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    final trackRRect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      const Radius.circular(10),
    );

    // RRect = rounded rectangle
    canvas.drawRRect(trackRRect, trackPaint);

    // Progress
    final progressPaint = Paint()
      ..color = Colors.grey.shade500
      ..style = PaintingStyle.fill;

    final progressRRect = RRect.fromLTRBR(
      0,
      0,
      progress,
      size.height,
      const Radius.circular(10),
    );

    canvas.drawRRect(progressRRect, progressPaint);

    // Thumb
    canvas.drawCircle(
      Offset(progress, size.height * 0.5),
      10,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant MusicPlayerProgressBarPaint oldDelegate) {
    return oldDelegate.progressValue != progressValue;
  }
}
