import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveRotatingButtonScreen extends StatefulWidget {
  const RiveRotatingButtonScreen({super.key});

  @override
  State<RiveRotatingButtonScreen> createState() =>
      _RiveRotatingButtonScreenState();
}

class _RiveRotatingButtonScreenState extends State<RiveRotatingButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          RiveAnimation.asset(
            "assets/animations/button.riv",
            stateMachines: ["state"],
          ),
          Center(
            child: Text(
              "Hold Press",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
