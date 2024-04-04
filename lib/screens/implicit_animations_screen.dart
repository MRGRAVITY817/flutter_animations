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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nested Implicit Animations Example
            AnimatedAlign(
              alignment: _visible ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceInOut,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: _visible ? Colors.lime : Colors.blueGrey,
                  )),
            ),
            const SizedBox(height: 32),
            // Animated Container Example
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.elasticOut,
              decoration: BoxDecoration(
                color: _visible ? Colors.teal : Colors.amber,
                borderRadius: _visible
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(100),
              ),
              width: _visible ? 200 : 100,
              height: _visible ? 100 : 200,
              transform:
                  _visible ? Matrix4.rotationZ(0) : Matrix4.rotationZ(0.5),
              transformAlignment: Alignment.center,
            ),
            const SizedBox(height: 32),
            // Tween Animation Builder Example
            TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.red, end: Colors.green),
                duration: const Duration(seconds: 1),
                curve: Curves.bounceInOut,
                builder: (context, value, child) {
                  return Image.network(
                    "https://picsum.photos/200/180",
                    color: value,
                    colorBlendMode: BlendMode.modulate,
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
