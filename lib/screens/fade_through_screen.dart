import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeThroughScreen extends HookWidget {
  const FadeThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState<int>(0);

    void onNewPage(int newIndex) {
      index.value = newIndex;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade Through"),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index.value,
        onDestinationSelected: onNewPage,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_none),
            label: "Notifications",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: [
          const NavigationPage(
            key: ValueKey(0),
            text: "Profile",
            icon: Icons.person,
          ),
          const NavigationPage(
            key: ValueKey(1),
            text: "Notifications",
            icon: Icons.notifications,
          ),
          const NavigationPage(
            key: ValueKey(2),
            text: "Settings",
            icon: Icons.settings,
          ),
        ][index.value],
      ),
    );
  }
}

class NavigationPage extends StatelessWidget {
  final String text;
  final IconData icon;

  const NavigationPage({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
