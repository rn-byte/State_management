import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;
  incremntCounter() {
    counter.value++;
    debugPrint('${counter.value}');
  }
}
