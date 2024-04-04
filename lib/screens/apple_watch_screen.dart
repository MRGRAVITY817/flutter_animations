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
      duration: const Duration(seconds: 1),
    )..forward();

    late final curve = CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,
    );

    final progress = useState<Animation<double>>(
      Tween<double>(
        begin: 0.0005,
        end: 1.5,
      ).animate(curve),
    );

    void animateValues() {
      final newBegin = progress.value.value;
      final random = Random();
      final newEnd = random.nextDouble() * 2.0;

      progress.value = Tween(begin: newBegin, end: newEnd).animate(curve);
      animationController.forward(from: 0.0);
    }

    useEffect(() {
      return () {
        animationController.dispose();
      };
    }, []);

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

  AppleWatchPainter({required this.progress});

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
      progress * pi,
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
      progress * pi,
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
      progress * pi,
      false,
      blueArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    // Repaint only when progress changes
    return oldDelegate.progress != progress;
  }
}
