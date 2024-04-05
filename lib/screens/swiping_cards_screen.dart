import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SwipingCardsScreen extends HookWidget {
  const SwipingCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final tickerProvider = useSingleTickerProvider();
    final controller = useAnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
      // Since animation controller limits the bound between 0 and 1 by default,
      // we need to set the lower and upper bounds to the screen width
      lowerBound: -size.width,
      upperBound: size.width,
    );

    void onDragUpdate(DragUpdateDetails details) {
      controller.value += details.delta.dx;
    }

    void onDragEnd(DragEndDetails details) {
      controller.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.bounceOut,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Swiping Cards"),
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onHorizontalDragUpdate: onDragUpdate,
                    onHorizontalDragEnd: onDragEnd,
                    child: Transform.translate(
                      offset: Offset(controller.value, 0),
                      child: Material(
                        elevation: 10,
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: size.height * 0.8,
                          child: Container(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
