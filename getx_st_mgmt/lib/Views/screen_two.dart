import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenTwo extends StatefulWidget {
  var name;
  ScreenTwo({
    this.name,
    super.key,
  });

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "This is screen Two Mr. ${Get.arguments[0]} ${Get.arguments[1]}"),
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Get.back();
                },
                child: const Text('Go Back'))
          ],
        ),
      ),
    );
  }
}
