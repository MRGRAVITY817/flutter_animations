import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: Center(
        child: Animate(
          effects: [
            FadeEffect(
              begin: 0.0,
              end: 1.0,
              duration: 1.seconds,
              curve: Curves.easeIn,
            ),
            ScaleEffect(
              alignment: Alignment.center,
              begin: Offset.zero,
              end: const Offset(1, 1),
              duration: 1.seconds,
            )
          ],
          child: const Text(
            "Hello!",
            style: TextStyle(fontSize: 66),
          ),
        ),
      ),
    );
  }
}
