// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<BurgerProduct>> burgerProductListNotifier =
    ValueNotifier([]);
void addBurgerProduct(BurgerProduct value) async {
  await Hive.openBox<BurgerProduct>('burger');
  final burgerProductDB = await Hive.openBox<BurgerProduct>('burger');
   burgerProductDB.add(value);
  burgerProductListNotifier.value.add(value);
  burgerProductListNotifier.notifyListeners();
}

Future<void> getAllBurgerProducts() async {
  final burgerProductDB = await Hive.openBox<BurgerProduct>('burger');
  burgerProductListNotifier.value.clear();
  burgerProductListNotifier.value.addAll(burgerProductDB.values);
  burgerProductListNotifier.notifyListeners();
}
Future<void> deleteBurgerProduct(index)async{
   final burgerProductDB = await Hive.openBox<BurgerProduct>('burger');
   burgerProductDB.deleteAt(index);
   getAllBurgerProducts();
}




