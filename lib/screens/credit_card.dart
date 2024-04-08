import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/card_detail_screen.dart';

class CreditCard extends StatelessWidget {
  final Color bgColor;
  final bool isExpanded;

  const CreditCard({
    super.key,
    required this.bgColor,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    void showDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CardDetailScreen(bgColor: bgColor),
        ),
      );
    }

    return Material(
      // Wrapping in Material will prevent sudden overflow
      // that happens when doing hero animation between screens.
      type: MaterialType.transparency,
      child: AbsorbPointer(
        absorbing: !isExpanded,
        child: GestureDetector(
          onTap: showDetails,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: bgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomad Coders',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '**** **** **75',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
