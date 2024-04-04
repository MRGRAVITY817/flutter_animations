import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            // AnimatedContainer is a widget that automatically animates changes to its properties.
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              width: _visible ? size.width * 0.8 : size.width * 0.3,
              height: _visible ? size.width * 0.3 : size.width * 0.8,
              transform: _visible
                  ? Matrix4.rotationZ(0)
                  : Matrix4.rotationZ(0.5 * 3.14),
              transformAlignment: Alignment.center,
              decoration: BoxDecoration(
                color: _visible ? Colors.blue : Colors.amber,
                borderRadius: BorderRadius.circular(_visible ? 0 : 100),
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
