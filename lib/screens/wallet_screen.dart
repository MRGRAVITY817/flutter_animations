import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/credit_card.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CreditCard(bgColor: Colors.purple),
              CreditCard(bgColor: Colors.black),
              CreditCard(bgColor: Colors.blue),
            ],
          )),
    );
  }
}
