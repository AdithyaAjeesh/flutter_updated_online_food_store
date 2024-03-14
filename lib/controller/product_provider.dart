import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';
import 'package:flutter_store_app/service/burger_functioins.dart';
import 'package:flutter_store_app/service/soft_drink_functions.dart';

class ProductProvider extends ChangeNotifier {
  addBiriyaniProductProvider(BiriyaniProduct value) {
    addBiriyaniProduct(value);
    notifyListeners();
  }

  addBurgerProductProvider(BurgerProduct value) {
    addBurgerProduct(value);
    notifyListeners();
  }

  addSoftDrinkProductProvider(SoftDrinkProduct value) {
    addSoftDrinkProduct(value);
    notifyListeners();
  }

  deleteBiriyaniProductsProvider(index) {
    deleteBiriyaniProducts(index);
    notifyListeners();
  }

  deleteBurgerProductProvider(index) {
    deleteBurgerProduct(index);
    notifyListeners();
  }

  deleteSoftDrinkProductsProvider(index) {
    deleteSoftDrinkProducts(index);
    notifyListeners();
  }

  getAllBiriyaniProductsProvider() {
    getAllBiriyaniProducts();
    notifyListeners();
  }

  getAllBurgerProductsProvider() {
    getAllBurgerProducts();
    notifyListeners();
  }

  getAllSoftDrinkProductsProvider() {
    getAllSoftDrinkProducts();
    notifyListeners();
  }
}
