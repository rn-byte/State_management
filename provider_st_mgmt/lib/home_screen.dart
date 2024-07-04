import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var num = 1;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        num++;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}\n$num',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          num++;
          if (kDebugMode) {
            print(num.toString());
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
