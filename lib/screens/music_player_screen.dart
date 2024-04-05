import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.music_note,
              size: 100,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Play music
              },
              child: const Text("Play"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Pause music
              },
              child: const Text("Pause"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Stop music
              },
              child: const Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}
