import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';
import 'package:flutter_store_app/service/burger_functioins.dart';
import 'package:flutter_store_app/service/soft_drink_functions.dart';
import 'package:flutter_store_app/view/pages/admin_page/edit_product_page.dart';

class EditProductProvider extends ChangeNotifier {
  Widget buildProductCard(dynamic product) {
    if (product is SoftDrinkProduct) {
      return SoftDrinkEditCard(softDrinkProduct: product);
    } else if (product is BurgerProduct) {
      return BurgerEditCard(burgerProduct: product);
    } else if (product is BiriyaniProduct) {
      return BiriyaniEditCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  deleteAnyProductProvider(dynamic product, index) {
    if (product is BurgerProduct) {
      deleteBurgerProduct(index);
      notifyListeners();
    }
    if (product is SoftDrinkProduct) {
      deleteSoftDrinkProducts(index);
      notifyListeners();
    }
    if (product is BiriyaniProduct) {
      deleteBiriyaniProducts(index);
      notifyListeners();
    }
  }
}
