import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
            ...[
              for (final _ in List.generate(6, (_) => 0))
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      "Uniqlo",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text("T-Shirts"),
                    trailing: const Text(
                      "-\$10",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
            ]
                .animate(interval: 500.ms)
                .fadeIn(begin: 0)
                .flipV(begin: -0.5, end: 0, curve: Curves.bounceOut)
          ],
        ),
      ),
    );
  }
}
