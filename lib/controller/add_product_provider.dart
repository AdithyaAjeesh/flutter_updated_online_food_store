import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/service/admin_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductPageProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final catagoryController = TextEditingController();
  final disceriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? image;

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    } else {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> addProduct(BuildContext context) async {
    final category = catagoryController.text.trim();
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final description = disceriptionController.text.trim();

    if (name.isEmpty || price.isEmpty || description.isEmpty || image == null) {
      return;
    }

    final provider = Provider.of<ProductProvider>(context, listen: false);

    if (category == 'burger') {
      final product = BurgerProduct(
        id: 1,
        name: name,
        image: image!.path,
        description: description,
        price: price,
        quantity: 1,
        catagory: '',
      );
      provider.addBurgerProductProvider(product);
    } else if (category == 'biriyani') {
      final product = BiriyaniProduct(
        id: 1,
        name: name,
        image: image!.path,
        description: description,
        price: price,
        quantity: 1,
        catagory: '',
      );
      provider.addBiriyaniProductProvider(product);
    } else if (category == 'softdrink') {
      final product = SoftDrinkProduct(
        id: 1,
        name: name,
        image: image!.path,
        description: description,
        price: price,
        quantity: 1,
        catagory: '',
      );
      provider.addSoftDrinkProductProvider(product);
    }

    Navigator.of(context).pop();
  }

deleteAllDataProvider() {
  deleteAllData();
  notifyListeners();
}
}

