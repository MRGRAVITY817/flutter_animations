import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/apple_watch_screen.dart';
import 'package:flutter_animations/screens/explicit_animations_screen.dart';
import 'package:flutter_animations/screens/implicit_animations_screen.dart';
import 'package:flutter_animations/screens/music_player_screen.dart';
import 'package:flutter_animations/screens/rive_blurred_balls_screen.dart';
import 'package:flutter_animations/screens/rive_old_man_screen.dart';
import 'package:flutter_animations/screens/rive_rotating_button_screen.dart';
import 'package:flutter_animations/screens/rive_stars_screen.dart';
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
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => goToPage(const RiveOldManScreen()),
                  child: const Text("Rive - Old man"),
                ),
                ElevatedButton(
                  onPressed: () => goToPage(const RiveStarsScreen()),
                  child: const Text("Rive - Stars"),
                ),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => goToPage(const RiveBlurredBallsScreen()),
                  child: const Text("Rive - Balls"),
                ),
                ElevatedButton(
                  onPressed: () => goToPage(const RiveRotatingButtonScreen()),
                  child: const Text("Rive - Button"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
