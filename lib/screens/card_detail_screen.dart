import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/credit_card.dart';

class CardDetailScreen extends StatelessWidget {
  final Color bgColor;
  const CardDetailScreen({
    super.key,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(
              tag: bgColor,
              child: CreditCard(
                bgColor: bgColor,
                isExpanded: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
