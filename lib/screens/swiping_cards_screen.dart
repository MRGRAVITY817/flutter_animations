import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SwipingCardsScreen extends HookWidget {
  const SwipingCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final posX = useState(0.0);

    void onDragUpdate(DragUpdateDetails details) {
      posX.value += details.delta.dx;
    }

    void onDragEnd(DragEndDetails details) {
      posX.value = 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Swiping Cards"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onHorizontalDragUpdate: onDragUpdate,
              onHorizontalDragEnd: onDragEnd,
              child: Transform.translate(
                offset: Offset(posX.value, 0),
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
      ),
    );
  }
}
