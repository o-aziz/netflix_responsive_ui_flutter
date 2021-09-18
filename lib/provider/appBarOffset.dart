import 'package:flutter/material.dart';

class AppBarOffset extends ChangeNotifier {
  double _appBarOffset = 0;

  double get appBarOffset => _appBarOffset;
  set appBarOffset(double appBarOffset) {
    _appBarOffset = appBarOffset;
    notifyListeners();
  }
}
