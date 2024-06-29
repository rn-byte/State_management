import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValueNotifyListenerScreen extends StatelessWidget {
  ValueNotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    debugPrint('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider in StatelessWidget"),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (context, value, child) {
            return Text(
              _counter.value.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Colors.red,
        onPressed: () {
          _counter.value++;
          debugPrint(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
