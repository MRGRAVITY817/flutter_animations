import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MusicPlayerDetailScreen extends HookWidget {
  final int index;

  const MusicPlayerDetailScreen({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tickerProvider = useSingleTickerProvider();
    final progressController = useAnimationController(
      vsync: tickerProvider,
      duration: const Duration(minutes: 1),
    );

    progressController.repeat(reverse: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Interstellar"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Hero(
            tag: "$index",
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/ost/$index.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedBuilder(
            animation: progressController,
            builder: (context, _) {
              return CustomPaint(
                size: Size(size.width - 80, 5),
                painter: ProgressBar(
                  progressValue: progressController.value,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends CustomPainter {
  final double progressValue;

  const ProgressBar({
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
  bool shouldRepaint(covariant ProgressBar oldDelegate) {
    return oldDelegate.progressValue != progressValue;
  }
}
