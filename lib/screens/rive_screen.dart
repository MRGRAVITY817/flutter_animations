import 'package:flutter/material.dart';

class RiveScreen extends StatelessWidget {
  const RiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rive Animations"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 400),
          ],
        ),
      ),
    );
  }
}
