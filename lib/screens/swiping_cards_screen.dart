import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SwipingCardsScreen extends HookWidget {
  const SwipingCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late final dropzone = size.width + 100;
    final index = useState<int>(0);
    final maxIndex = 6;

    final tickerProvider = useSingleTickerProvider();
    final position = useAnimationController(
      vsync: tickerProvider,
      duration: const Duration(milliseconds: 500),
      // Since animation controller limits the bound between 0 and 1 by default,
      // we need to set the lower and upper bounds to the screen width
      lowerBound: -dropzone,
      upperBound: dropzone,
    );

    late final Tween<double> rotation = Tween<double>(
      begin: -15,
      end: 15,
    );

    void onDragUpdate(DragUpdateDetails details) {
      position.value += details.delta.dx;
    }

    void whenDragComplete() {
      position.value = 0;
      if (index.value == maxIndex) {
        index.value = 0;
      } else {
        index.value += 1;
      }
    }

    void onDragEnd(DragEndDetails details) {
      final bound = size.width - 150;

      // When the card is dragged to the left or right almost to the end,
      // animate the card to disappear
      if (position.value.abs() > bound) {
        position
            .animateTo(
              position.value > 0 ? dropzone : -dropzone,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            )
            .whenComplete(whenDragComplete);
      } else {
        position
            .animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            )
            .whenComplete(whenDragComplete);
      }
    }

    late final Tween<double> scale = Tween<double>(
      begin: 0.8,
      end: 1,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Swiping Cards"),
      ),
      body: AnimatedBuilder(
          animation: position,
          builder: (context, child) {
            final angle = rotation.transform(
                  // Start from the center of the screen
                  (position.value + size.width / 2) / size.width,
                ) *
                (pi / 180);

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: size.height * 0.1,
                  child: Transform.scale(
                    scale: scale.transform(
                      (position.value.abs() + size.width / 2) / size.width,
                    ),
                    child: Card(
                      index: index.value == maxIndex ? 0 : index.value + 1,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  child: GestureDetector(
                    onHorizontalDragUpdate: onDragUpdate,
                    onHorizontalDragEnd: onDragEnd,
                    child: Transform.translate(
                      offset: Offset(position.value, 0),
                      child: Transform.rotate(
                          angle: angle, child: Card(index: index.value)),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class Card extends StatelessWidget {
  final int index;

  const Card({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.5,
          child: Image.asset(
            "assets/covers/$index.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
