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

    final cardColors = [
      Colors.purple,
      Colors.blue,
      Colors.black,
    ];

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
              for (final i in [0, 1, 2])
                Hero(
                  tag: cardColors[i],
                  child: CreditCard(
                    bgColor: cardColors[i],
                    isExpanded: expanded.value,
                  )
                      .animate(
                        delay: 750.ms,
                        target: expanded.value ? 0 : 1,
                      )
                      .flipV(end: 0.1)
                      .slideY(end: -0.8 * i),
                ),
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
