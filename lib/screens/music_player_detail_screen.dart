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

    // Progress related stuffs
    final progressController = useAnimationController(
      duration: const Duration(minutes: 1),
    )..repeat(reverse: true);

    String formatTime(double value) {
      final durationFromValue = Duration(seconds: (value * 60).toInt());
      return '${durationFromValue.inMinutes.remainder(60).toString().padLeft(2, '0')}:${durationFromValue.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    }

    final progress = useValueNotifier(0.0);

    progressController.addListener(() {
      progress.value = progressController.value;
    });

    // Marquee related stuffs
    final marqueeController = useAnimationController(
      duration: const Duration(seconds: 20),
    )..repeat(reverse: true);

    late final Animation<Offset> marqueeTween = Tween(
      begin: const Offset(0.1, 0),
      end: const Offset(-0.6, 0),
    ).animate(marqueeController);

    // Play Pause related stuffs

    final playPauseController = useAnimationController(
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    onPlayPauseTap() {
      if (playPauseController.isCompleted) {
        playPauseController.reverse();
      } else {
        playPauseController.forward();
      }
    }

    final dragging = useState(false);

    final volumeBarMaxWidth = size.width - 80;

    toggleDragging() {
      dragging.value = !dragging.value;
    }

    final volume = useValueNotifier<double>(0);

    onVolumeDragUpdate(DragUpdateDetails details) {
      volume.value += details.delta.dx;
      volume.value = volume.value.clamp(0.0, volumeBarMaxWidth);
    }

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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ValueListenableBuilder(
              valueListenable: progress,
              builder: (context, value, child) {
                return Row(
                  children: [
                    Text(
                      formatTime(value),
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      formatTime(1 - value),
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Interstellar",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SlideTransition(
            position: marqueeTween,
            child: const Text(
              "A Film By Christopher Nolan - Original Motion Picture Soundtrack",
              maxLines: 1,
              overflow: TextOverflow.visible,
              style: TextStyle(fontSize: 18),
              softWrap: false,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: onPlayPauseTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedIcon(
                  icon: AnimatedIcons.pause_play,
                  progress: playPauseController,
                  size: 60,
                ),
                // LottieBuilder.asset(
                //   "assets/animations/play-pause.json",
                //   controller: playPauseController,
                //   onLoaded: (composition) {
                //     // If you want to use duration that your lottie widget is meant to follow,
                //     // allocate composition.duration to playPauseController.duration.
                //     playPauseController.duration = composition.duration;
                //   },
                //   width: 200,
                //   height: 200,
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onHorizontalDragStart: (_) => toggleDragging(),
            onHorizontalDragEnd: (_) => toggleDragging(),
            onHorizontalDragUpdate: onVolumeDragUpdate,
            child: AnimatedScale(
              scale: dragging.value ? 1.1 : 1,
              duration: const Duration(milliseconds: 200),
              curve: Curves.bounceOut,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ValueListenableBuilder(
                  valueListenable: volume,
                  builder: (context, value, child) {
                    return CustomPaint(
                      size: Size(size.width - 80, 20),
                      painter: VolumeBarPaint(volume: value),
                    );
                  },
                ),
              ),
            ),
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

class VolumeBarPaint extends CustomPainter {
  final double volume;

  VolumeBarPaint({
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
  bool shouldRepaint(covariant VolumeBarPaint oldDelegate) {
    return oldDelegate.volume != volume;
  }
}
