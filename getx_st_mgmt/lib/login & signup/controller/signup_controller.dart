import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SignupController extends GetxController {
  RxBool visibilityToggle = true.obs;
  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;

  setVisibility(bool value) {
    visibilityToggle.value = value;
  }

  void signupApi() async {
    loading.value = true;
    try {
      final response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email': emailController.value.text,
          'password': passController.value.text,
        },
      );
      var data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Register Successfull', data['token']);
      } else {
        loading.value = false;
        Get.snackbar('Register unsuccessfull', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
