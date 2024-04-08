import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SharedAxisScreen extends HookWidget {
  const SharedAxisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentImage = useState<int>(1);

    void goToImage(int image) {
      currentImage.value = image;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Axis Screen"),
      ),
      body: Column(
        children: [
          PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(
                transitionType: SharedAxisTransitionType.scaled,
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: Container(
              key: ValueKey(currentImage.value),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/ost/${currentImage.value}.jpg"),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final btn in [1, 2, 3, 4, 5])
                ElevatedButton(
                  onPressed: () => goToImage(btn),
                  child: Text("$btn"),
                )
            ],
          )
        ],
      ),
    );
  }
}
