import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animations/screens/credit_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WalletScreen extends HookWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expanded = useState(false);

    void onExpand() {
      expanded.value = true;
    }

    void onShrink() {
      expanded.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onVerticalDragEnd: (_) => onShrink(),
          onTap: onExpand,
          child: Column(
            children: [
              const CreditCard(bgColor: Colors.purple)
                  .animate(
                    delay: 750.ms,
                    target: expanded.value ? 0 : 1,
                  )
                  .flipV(end: 0.1),
              const CreditCard(bgColor: Colors.black)
                  .animate(
                    delay: 850.ms,
                    target: expanded.value ? 0 : 1,
                  )
                  .flipV(end: 0.1)
                  .slideY(end: -0.8),
              const CreditCard(bgColor: Colors.blue)
                  .animate(
                    delay: 950.ms,
                    target: expanded.value ? 0 : 1,
                  )
                  .flipV(end: 0.1)
                  .slideY(end: -0.8 * 2),
            ]
                .animate(interval: 250.ms)
                .fadeIn(begin: 0)
                .slideX(begin: -1, end: 0),
          ),
        ),
      ),
    );
  }
}
