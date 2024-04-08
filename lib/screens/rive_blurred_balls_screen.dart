import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveBlurredBallsScreen extends StatefulWidget {
  const RiveBlurredBallsScreen({super.key});

  @override
  State<RiveBlurredBallsScreen> createState() => _RiveBlurredBallsScreenState();
}

class _RiveBlurredBallsScreenState extends State<RiveBlurredBallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            "assets/animations/balls_animation.riv",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const Center(
                child: Text(
                  "Welcome to AI App",
                  style: TextStyle(
                    fontSize: 28,
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
