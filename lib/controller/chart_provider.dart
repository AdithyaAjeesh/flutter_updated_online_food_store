import 'package:flutter/material.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';
import 'package:flutter_store_app/service/burger_functioins.dart';
import 'package:flutter_store_app/service/soft_drink_functions.dart';

class ChartProvider extends ChangeNotifier {
  double biriyaniTotalPrice() {
    double total = 0;
    for (var item in biriyaniProductListNotifier.value) {
      total += double.parse(item.price);
    }
    return total;
  }

  double biriyaniTotalCount() {
    double count = 0;
    for (var item in biriyaniProductListNotifier.value) {
      count += item.quantity;
    }
    return count;
  }

  double burgerTotalPrice() {
    double total = 0;
    for (var item in burgerProductListNotifier.value) {
      total += double.parse(item.price);
    }
    return total;
  }

  double burgerTotalCount() {
    double count = 0;
    for (var item in burgerProductListNotifier.value) {
      count += item.quantity;
    }
    return count;
  }

  double softDrinkTotalPrice() {
    double total = 0;
    for (var item in softDrinkProductListNotifier.value) {
      total += double.parse(item.price);
    }
    return total;
  }

  double softDrinkTotalCount() {
    double count = 0;
    for (var item in softDrinkProductListNotifier.value) {
      count += item.quantity;
    }
    return count;
  }
}
