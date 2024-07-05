import 'package:get/get.dart';

class ExmapleThreeController extends GetxController {
  RxBool val = false.obs;
  setNotification(bool value) {
    val.value = value;
  }
}
