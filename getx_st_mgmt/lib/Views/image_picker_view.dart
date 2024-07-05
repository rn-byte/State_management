import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/controller/image_picker_controller.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX ImagePicker"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Obx(
        () {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundImage: controller.imagePath.isNotEmpty
                      ? FileImage(File(controller.imagePath.toString()))
                      : null,
                ),
                const SizedBox(
                  height: 80,
                ),
                TextButton(
                    onPressed: () {
                      controller.getImage();
                    },
                    child: const Text('Pick Image'))
              ],
            ),
          );
        },
      ),
    );
  }
}
