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
        child: const Text(
          "Hello!",
          style: TextStyle(fontSize: 66),
        )
            .animate()
            .fadeIn(
              begin: 0,
              duration: 1000.ms,
            )
            .scale(
              alignment: Alignment.center,
              begin: Offset.zero,
              duration: 1.seconds,
              end: const Offset(1, 1),
            )
            .then(delay: 500.ms)
            .slideX(
              begin: 0,
              end: -10,
              duration: 2.seconds,
            ),
      ),
    );
  }
}
