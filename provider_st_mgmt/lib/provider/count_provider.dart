import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 20;
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
