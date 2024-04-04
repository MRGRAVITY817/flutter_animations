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

    late final Animation<Color?> color = ColorTween(
      begin: Colors.amber,
      end: Colors.red,
    ).animate(controller);

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
            AnimatedBuilder(
              animation: color,
              builder: (context, child) {
                return Container(
                  width: 200,
                  height: 200,
                  color: color.value,
                );
              },
            ),
            const SizedBox(height: 20),
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
