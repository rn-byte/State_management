import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is screen One"),
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  //Get.back();

                  // Get.to(ScreenTwo(name: 'Ram'));

                  //Routes
                  Get.toNamed('/ScreenTwo', arguments: [
                    'Ram',
                    'Sharma',
                  ]);
                },
                child: const Text('GoTO ScreenTwo'))
          ],
        ),
      ),
    );
  }
}
