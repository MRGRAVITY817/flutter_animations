import 'package:flutter/material.dart';

class MusicPlayerVolumeBarPaint extends CustomPainter {
  final double volume;

  MusicPlayerVolumeBarPaint({
    required this.volume,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final progress = volume;

    final bgPaint = Paint()..color = Colors.grey.shade300;

    final bgRect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(bgRect, bgPaint);

    final volumePaint = Paint()..color = Colors.grey.shade500;

    final volumeRect = Rect.fromLTWH(
      0,
      0,
      progress,
      size.height,
    );

    canvas.drawRect(volumeRect, volumePaint);
  }

  @override
  bool shouldRepaint(covariant MusicPlayerVolumeBarPaint oldDelegate) {
    return oldDelegate.volume != volume;
  }
}
