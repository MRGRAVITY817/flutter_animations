import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveOldManScreen extends StatefulWidget {
  const RiveOldManScreen({super.key});

  @override
  State<RiveOldManScreen> createState() => _RiveOldManScreenState();
}

class _RiveOldManScreenState extends State<RiveOldManScreen> {
  late final StateMachineController _stateMachineController;

  void _onInit(Artboard artboard) {
    _stateMachineController = StateMachineController.fromArtboard(
      artboard,
      "state",
    )!;
    artboard.addController(_stateMachineController);
  }

  void _togglePanel() {
    final input = _stateMachineController.findInput<bool>("panelActive")!;
    input.change(!input.value);
  }

  @override
  void dispose() {
    _stateMachineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rive Animations"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: RiveAnimation.asset(
                "assets/animations/old-man-animation.riv",
                artboard: "main",
                stateMachines: const ["state"],
                onInit: _onInit,
              ),
            ),
            ElevatedButton(
              onPressed: _togglePanel,
              child: const Text("Toggle panel"),
            ),
          ],
        ),
      ),
    );
  }
}
