import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/controller/example_two_controller.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  final ExampleTwoController controller = Get.put(ExampleTwoController());
  //var opacity = .4;
  @override
  Widget build(BuildContext context) {
    debugPrint('REBUILD');
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Examole 2"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Container(
                  height: height * .3,
                  width: width * .5,
                  color: Colors.indigo.withOpacity(controller.opacity.value),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(
              () {
                return Slider(
                  value: controller.opacity.value,
                  onChanged: (value) {
                    debugPrint('$value');
                    controller.setValue(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
