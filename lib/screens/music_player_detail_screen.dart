import 'package:flutter/material.dart';

class MusicPlayerDetailScreen extends StatelessWidget {
  final int index;
  const MusicPlayerDetailScreen({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interstellar"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Hero(
            tag: "$index",
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/ost/$index.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
