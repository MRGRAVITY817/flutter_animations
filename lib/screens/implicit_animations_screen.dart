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
            TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.red, end: Colors.green),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: value,
                  );
                }),
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
