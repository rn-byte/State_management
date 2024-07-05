import 'package:get/get.dart';

class FavAppController extends GetxController {
  RxList<String> fruitList = ['Apple', 'Mango', 'Orange', 'Grapes'].obs;
  RxList tempList = [].obs;
  addListVal(String fruit) {
    tempList.add(fruit);
  }

  removeListVal(String fruit) {
    tempList.remove(fruit);
  }
}
