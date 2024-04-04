import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Widgets with "Animated" prefix are implicit animations
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _visible ? 1 : 0,
              child: Container(
                width: size.width * 0.8,
                height: size.width * 0.8,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _trigger,
              child: Text(_visible ? "Hide" : "Show"),
            ),
          ],
        ),
      ),
    );
  }
}
