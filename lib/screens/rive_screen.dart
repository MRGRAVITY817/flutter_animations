import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
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
              "Login",
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
