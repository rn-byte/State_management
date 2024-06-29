import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ValueNotifyListenerScreen extends StatelessWidget {
  ValueNotifyListenerScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    debugPrint('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider in StatelessWidget"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Example 2',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: ValueListenableBuilder(
                valueListenable: toogle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: toogle.value,
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            toogle.value = !toogle.value;
                          },
                          child: Icon(
                            toogle.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  );
                },
              )),
          const Divider(),
          const Text(
            'Example 1',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ],
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
