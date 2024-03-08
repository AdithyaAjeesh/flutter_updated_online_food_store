import 'package:flutter/material.dart';
import 'package:flutter_store_app/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/data/cart_model/cart_model.dart';
import 'package:flutter_store_app/data/softdrink_model/soft_drink_model.dart';
import 'package:hive/hive.dart';

class SettingProvider extends ChangeNotifier {
  Future<void> resetAllData(SettingProvider settingProvider) async {
    final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
    final burgerProductDB = await Hive.openBox<BurgerProduct>('burger');
    final cartBox = await Hive.openBox<CartItem>('cart');
    final softDrinkProductDB =
        await Hive.openBox<SoftDrinkProduct>('softdrink');
    biriyaniProductDB.clear();
    burgerProductDB.clear();
    cartBox.clear();
    softDrinkProductDB.clear();
  }
}
