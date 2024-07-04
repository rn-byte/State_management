import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is GetX Tutorial'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('Alert !!', 'This is GetX Test',
              backgroundColor: Colors.blue[200],
              snackPosition: SnackPosition.TOP,
              icon: const Icon(Icons.add),
              mainButton:
                  TextButton(onPressed: () {}, child: const Text('Click')));
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
