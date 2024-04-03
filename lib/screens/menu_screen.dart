import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/implicit_animations_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToPage(Widget page) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animations"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => goToPage(const ImplicitAnimationsScreen()),
              child: const Text("Implicit Animations"),
            ),
          ],
        ),
      ),
    );
  }
}
