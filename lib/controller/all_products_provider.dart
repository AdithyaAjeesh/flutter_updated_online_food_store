import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';
import 'package:flutter_store_app/service/burger_functioins.dart';
import 'package:flutter_store_app/service/soft_drink_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_details.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_details.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_details.dart';

class AllProductProvider extends ChangeNotifier {
  List<dynamic> allProducts = [];
  String searchQuery = '';

  Future<void> getAllProducts({String? query}) async {
    await Future.wait([
      getAllSoftDrinkProducts(),
      getAllBurgerProducts(),
      getAllBiriyaniProducts(),
    ]);

    allProducts = [
      ...softDrinkProductListNotifier.value,
      ...burgerProductListNotifier.value,
      ...biriyaniProductListNotifier.value,
    ];

    if (query != null && query.isNotEmpty) {
      allProducts = allProducts.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  Widget buildProductCard(dynamic product) {
    if (product is SoftDrinkProduct) {
      return SoftDrinkProductCard(softDrinkProduct: product);
    } else if (product is BurgerProduct) {
      return BurgerProductCard(burgerProduct: product);
    } else if (product is BiriyaniProduct) {
      return BiriyaniProductCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  void navigateToProductDetails(dynamic product, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (product is SoftDrinkProduct) {
            return SoftDrinkDetailsScreen(softDrinkProduct: product);
          } else if (product is BurgerProduct) {
            return BurgerDetailsScreen(burgerProduct: product);
          } else if (product is BiriyaniProduct) {
            return BiriyaniDetailsScreen(biriyaniProduct: product);
          }
          return const Scaffold();
        },
      ),
    );
  }

  int isSelected = 0;
  changePage(index) {
    isSelected = index;
    notifyListeners();
  }
}
