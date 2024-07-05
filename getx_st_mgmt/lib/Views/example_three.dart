import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/controller/exmaple_three_controller.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  final ExmapleThreeController controller = Get.put(ExmapleThreeController());
  @override
  Widget build(BuildContext context) {
    debugPrint('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Examole 3"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Notification'),
                Obx(() => Switch(
                      value: controller.val.value,
                      onChanged: (value) {
                        controller.setNotification(value);
                      },
                    )),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Obx(
              () => Text('${controller.val.value}'),
            ),
          ],
        ),
      ),
    );
  }
}
