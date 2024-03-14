// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<BiriyaniProduct>> biriyaniProductListNotifier =
    ValueNotifier([]);
void addBiriyaniProduct(BiriyaniProduct value) async {
  final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
  biriyaniProductDB.add(value);
  biriyaniProductListNotifier.value.add(value);
}

Future<void> getAllBiriyaniProducts() async {
  final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
  biriyaniProductListNotifier.value.clear();
  biriyaniProductListNotifier.value.addAll(biriyaniProductDB.values);
}

Future<void> deleteBiriyaniProducts(index) async {
  final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
  biriyaniProductDB.deleteAt(index);
  getAllBiriyaniProducts();
}
