import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ContainerTransformScreen extends HookWidget {
  const ContainerTransformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isGrid = useState<bool>(false);

    void toggleGrid() {
      isGrid.value = !isGrid.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Container Transform"),
        actions: [
          IconButton(
            onPressed: toggleGrid,
            icon: isGrid.value
                ? const Icon(Icons.list)
                : const Icon(Icons.grid_4x4),
          )
        ],
      ),
      body: isGrid.value
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: 20,
              itemBuilder: (context, index) => OpenContainer(
                openElevation: 0,
                closedElevation: 0, // Remove borders
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, action) =>
                    DetailScreen(image: (index % 5) + 1),
                closedBuilder: (context, action) => Column(
                  children: [
                    Image.asset("assets/ost/${(index % 5) + 1}.jpg"),
                    const Text("Dune Soundtrack"),
                    Text(
                      "Hans Zimmer",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => OpenContainer(
                openElevation: 0,
                closedElevation: 0, // Remove borders
                transitionDuration: const Duration(milliseconds: 500),
                openBuilder: (context, action) =>
                    DetailScreen(image: (index % 5) + 1),
                closedBuilder: (context, action) => ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/ost/${(index % 5) + 1}.jpg",
                        ),
                      ),
                    ),
                  ),
                  title: const Text("Dune Soundtrack"),
                  subtitle: const Text("Hans Zimmer"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int image;

  const DetailScreen({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Column(
        children: [
          Image.asset("assets/ost/$image.jpg"),
          const Text("Dune Soundtrack"),
        ],
      ),
    );
  }
}
