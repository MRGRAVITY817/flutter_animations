import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/apple_watch_screen.dart';
import 'package:flutter_animations/screens/explicit_animations_screen.dart';
import 'package:flutter_animations/screens/implicit_animations_screen.dart';
import 'package:flutter_animations/screens/music_player_screen.dart';
import 'package:flutter_animations/screens/swiping_cards_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToPage(Widget page) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animations"),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => goToPage(const ImplicitAnimationsScreen()),
              child: const Text("Implicit Animations"),
            ),
            ElevatedButton(
              onPressed: () => goToPage(const ExplicitAnimationsScreen()),
              child: const Text("Explicit Animations"),
            ),
            ElevatedButton(
              onPressed: () => goToPage(const AppleWatchScreen()),
              child: const Text("Apple Watch"),
            ),
            ElevatedButton(
              onPressed: () => goToPage(const SwipingCardsScreen()),
              child: const Text("Swiping Cards"),
            ),
            ElevatedButton(
              onPressed: () => goToPage(const MusicPlayerScreen()),
              child: const Text("Music Player"),
            ),
          ],
        ),
      ),
    );
  }
}
