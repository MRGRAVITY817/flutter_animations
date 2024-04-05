import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MusicPlayerScreen extends HookWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const maxIndex = 6;

    final pageController = usePageController(viewportFraction: 0.8);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: maxIndex,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/covers/$index.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Song $index",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Artist $index"),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
