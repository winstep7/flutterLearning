import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  get getCounter => _counter;

  counterUp() {
    _counter++;
    notifyListeners();
  }

  counterDown() {
    _counter--;
    notifyListeners();
  }
}
