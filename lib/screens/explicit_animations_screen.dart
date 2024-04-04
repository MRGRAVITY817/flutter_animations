import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExplicitAnimationsScreen extends HookWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ticker runs the callback every frame
    // SingleTickerProvider will run only on this widget
    final tickerProvider = useSingleTickerProvider();
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
      vsync: tickerProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
                scale: controller, child: const FlutterLogo(size: 200)),
            ElevatedButton(
              onPressed: () {
                if (controller.isCompleted) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: Text(controller.isCompleted ? 'Reverse' : 'Forward'),
            ),
          ],
        ),
      ),
    );
  }
}
