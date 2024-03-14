import 'package:flutter/material.dart';

class AllProductProvider extends ChangeNotifier {
  int isSelected = 0;
  changePage(index) {
    isSelected = index;
    notifyListeners();
  }
}
