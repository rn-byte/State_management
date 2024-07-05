import 'package:get/get.dart';

class ExampleTwoController extends GetxController {
  RxDouble opacity = .4.obs;

  setValue(double value) {
    opacity.value = value;
  }
}
