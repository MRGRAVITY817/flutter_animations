import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppleWatchScreen extends HookWidget {
  const AppleWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tickerProvider = useSingleTickerProvider();
    final animationController = useAnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    late final curve = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    );

    final random = Random();

    final progress = useState<Animation<double>>(
      Tween<double>(
        begin: 0.005,
        end: 1.5 * random.nextDouble(),
      ).animate(curve),
    );

    final redArcEnd = useState<double>(random.nextDouble());
    final greenArcEnd = useState<double>(random.nextDouble());
    final blueArcEnd = useState<double>(random.nextDouble());

    void animateValues() {
      final newBegin = progress.value.value;
      final newEnd = random.nextDouble() * 2.0;

      // Update arc end values
      redArcEnd.value = random.nextDouble();
      greenArcEnd.value = random.nextDouble();
      blueArcEnd.value = random.nextDouble();

      progress.value = Tween(begin: newBegin, end: newEnd).animate(curve);

      animationController.forward(from: 0.0);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Watch"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: progress.value,
          builder: (context, child) {
            return CustomPaint(
              // Creates 400 x 400 canvas
              size: const Size(300, 300),
              painter: AppleWatchPainter(
                progress: progress.value.value,
                redArcEnd: redArcEnd.value,
                greenArcEnd: greenArcEnd.value,
                blueArcEnd: blueArcEnd.value,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.3),
        onPressed: animateValues,
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  final double progress;
  final double redArcEnd;
  final double greenArcEnd;
  final double blueArcEnd;

  AppleWatchPainter({
    required this.progress,
    this.redArcEnd = 0.5,
    this.greenArcEnd = 0.5,
    this.blueArcEnd = 0.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Draw red circle and arc
    drawCircleAndArc(
      canvas: canvas,
      center: center,
      circleRadius: size.width / 2.0,
      circleColor: Colors.redAccent,
      arcColor: Colors.redAccent.shade400,
      arcEnd: redArcEnd,
      progress: progress,
    );

    // Draw green circle and arc
    drawCircleAndArc(
      canvas: canvas,
      center: center,
      circleRadius: size.width / 2.5,
      circleColor: Colors.limeAccent,
      arcColor: Colors.limeAccent.shade400,
      arcEnd: greenArcEnd,
      progress: progress,
    );

    // Draw blue circle and arc
    drawCircleAndArc(
      canvas: canvas,
      center: center,
      circleRadius: size.width / 3.33,
      circleColor: Colors.cyanAccent,
      arcColor: Colors.cyanAccent.shade400,
      arcEnd: blueArcEnd,
      progress: progress,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    // Repaint only when progress changes
    return oldDelegate.progress != progress;
  }
}

/// Helper function to draw a circle and an arc on the canvas
void drawCircleAndArc({
  required Canvas canvas,
  required Offset center,
  required double circleRadius,
  required Color circleColor,
  required double arcEnd,
  required Color arcColor,
  required double progress,
}) {
  const strokeWidth = 22.0;
  const startingAngle = -0.5 * pi;

  // draw circle
  final Paint circlePaint = Paint()
    ..color = circleColor.withOpacity(0.3)
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;

  canvas.drawCircle(center, circleRadius, circlePaint);

  // draw arc
  final Paint arcPaint = Paint()
    ..color = arcColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeCap = StrokeCap.round;
  final arcRect = Rect.fromCircle(center: center, radius: circleRadius);

  canvas.drawArc(
    arcRect,
    startingAngle,
    arcEnd * progress * pi,
    false,
    arcPaint,
  );
}
