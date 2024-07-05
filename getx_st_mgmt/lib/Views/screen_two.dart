import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatefulWidget {
  //var name;
  const ScreenTwo({
    super.key,
  });

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two Mr. ${Get.arguments[0]} ${Get.arguments[1]}'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //     "This is screen Two Mr. ${Get.arguments[0]} ${Get.arguments[1]}"),
          // TextButton(
          //     onPressed: () {
          //       // Navigator.pop(context);
          //       Get.back();
          //     },
          //     child: const Text('Go Back'))
          Container(
            height: Get.height * .3,
            width: Get.width * 1,
            color: Colors.green,
            child: const Center(child: Text('Container 1')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * .3,
                width: Get.width * .5,
                color: Colors.red,
                child: const Center(child: Text('Container 2')),
              ),
              Container(
                height: Get.height * .6,
                width: Get.width * .5,
                color: Colors.purple,
                child: const Center(child: Text('Container 2')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
