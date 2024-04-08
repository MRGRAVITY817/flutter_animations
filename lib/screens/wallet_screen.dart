import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animations/screens/credit_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // children: AnimateList(
          //   interval: 500.ms,
          //   effects: [
          //     const SlideEffect(begin: Offset(-1, 0), end: Offset.zero),
          //     const FadeEffect(begin: 0.0, end: 1.0)
          //   ],
          //   children: [
          //     const CreditCard(bgColor: Colors.purple),
          //     const CreditCard(bgColor: Colors.black),
          //     const CreditCard(bgColor: Colors.blue),
          //   ],
          // ),
          children: [
            const CreditCard(bgColor: Colors.purple),
            const CreditCard(bgColor: Colors.black),
            const CreditCard(bgColor: Colors.blue),
          ]
              .animate(interval: 500.ms)
              .fadeIn(begin: 0)
              .slideX(begin: -1, end: 0),
        ),
      ),
    );
  }
}
