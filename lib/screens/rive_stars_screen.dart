import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveStarsScreen extends StatefulWidget {
  const RiveStarsScreen({super.key});

  @override
  State<RiveStarsScreen> createState() => _RiveStarsScreenState();
}

class _RiveStarsScreenState extends State<RiveStarsScreen> {
  late final StateMachineController _stateMachineController;

  void _onInit(Artboard artboard) {
    _stateMachineController = StateMachineController.fromArtboard(
      artboard,
      "state",
      onStateChange: (stateMachineName, stateName) {
        print("$stateMachineName - $stateName");
      },
    )!;
    artboard.addController(_stateMachineController);
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
        child: Container(
          color: Colors.pinkAccent,
          width: double.infinity,
          child: RiveAnimation.asset(
            "assets/animations/stars-animation.riv",
            artboard: "artboard",
            stateMachines: const ["state"],
            onInit: _onInit,
          ),
        ),
      ),
    );
  }
}
