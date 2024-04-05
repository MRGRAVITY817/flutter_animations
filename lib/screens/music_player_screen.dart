import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MusicPlayerScreen extends HookWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const maxIndex = 6;

    final pageController = usePageController(viewportFraction: 0.8);
    final currentPage = useState(0);

    void handlePageChange(int index) {
      currentPage.value = index;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Blurred background
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              // AnimatedSwitcher changes only when child is changed
              // To manually change it, use key on child Container.
              key: ValueKey(currentPage.value),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/covers/${currentPage.value}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 20,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: pageController,
            onPageChanged: handlePageChange,
            itemCount: maxIndex,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 350,
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
                        image: AssetImage("assets/covers/$index.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Song $index",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Artist $index",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
