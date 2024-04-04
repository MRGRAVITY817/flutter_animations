import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExplicitAnimationsScreen extends HookWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ticker runs the callback every frame
    // SingleTickerProviderMixin will run ticker only on this widget
    final tickerProvider = useSingleTickerProvider();
    // So why we need a "ticker"?
    // Our animation controller will need a "ticker" to run the animation
    // ** if you have multiple animations, you can use TickerProviderStateMixin
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
      vsync: tickerProvider,
    );

    final CurvedAnimation curved = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
    );

    late final Animation<Decoration> decoration = DecorationTween(
      begin: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      end: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
    ).animate(curved);

    late final Animation<double> rotate = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(curved);

    late final Animation<double> scale = Tween<double>(
      begin: 1,
      end: 0.5,
    ).animate(curved);

    late final Animation<Offset> offset = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.5, 0.5),
    ).animate(curved);

    void play() {
      // Run the animation forward
      controller.forward();
    }

    void pause() {
      // Stop the animation
      controller.stop();
    }

    void rewind() {
      // Run the animation in reverse
      controller.reverse();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Widgets with "Transitions" suffix are used for explicit animations
            // For them, we don't need to wrap them with "AnimatedBuilder"
            SlideTransition(
              position: offset,
              child: ScaleTransition(
                scale: scale,
                child: RotationTransition(
                  turns: rotate,
                  child: DecoratedBoxTransition(
                    decoration: decoration,
                    child: const SizedBox(
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: <Widget>[
                ElevatedButton(
                  onPressed: play,
                  child: const Text('Play'),
                ),
                ElevatedButton(
                  onPressed: pause,
                  child: const Text('Pause'),
                ),
                ElevatedButton(
                  onPressed: rewind,
                  child: const Text('Rewind'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
