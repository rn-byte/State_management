import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExampleOneProvider with ChangeNotifier {
  double _values = 1.0;
  double get values => _values;
  void setValues(val) {
    _values = val;
    notifyListeners();
  }
}
