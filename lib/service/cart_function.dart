// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<CartItem>> cartItemListNotifier = ValueNotifier([]);

void addToCart(CartItem item) async {
  final cartBox = await Hive.openBox<CartItem>('cart');
  cartBox.add(item);
  cartItemListNotifier.value.add(item);
  cartItemListNotifier.notifyListeners();
}

Future<void> getAllCartItems() async {
  final cartBox = await Hive.openBox<CartItem>('cart');
  cartItemListNotifier.value.clear();
  cartItemListNotifier.value.addAll(cartBox.values);
  cartItemListNotifier.notifyListeners();
}

Future<void> deleteCartItem(int index) async {
  final cartBox = await Hive.openBox<CartItem>('cart');
  await cartBox.deleteAt(index);
  getAllCartItems();
  cartItemListNotifier.notifyListeners();
}
