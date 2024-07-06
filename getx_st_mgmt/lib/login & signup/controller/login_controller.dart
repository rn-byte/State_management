import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  RxBool visibilityToggle = true.obs;
  RxBool loading = false.obs;
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;

  setVisibility(bool value) {
    visibilityToggle.value = value;
  }

  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(
        Uri.parse('https://reqres.in/api/login'),
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
        Get.snackbar('Login Successfull', data['token']);
      } else {
        loading.value = false;
        Get.snackbar('Login unsuccessfull', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
