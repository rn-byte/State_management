import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/controller/counter_controller.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    debugPrint('REbuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Counter"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Text(
                  '${controller.counter}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incremntCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
