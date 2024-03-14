import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/service/soft_drink_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_details.dart';
import 'package:provider/provider.dart';

class SoftDrinkPage extends StatefulWidget {
  const SoftDrinkPage({super.key});

  @override
  State<SoftDrinkPage> createState() => _SoftDrinkPageState();
}

class _SoftDrinkPageState extends State<SoftDrinkPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    // getAllSoftDrinkProducts();
    provider.getAllSoftDrinkProductsProvider();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Soft Drink',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: Column(
        children: [
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: softDrinkProductListNotifier,
            builder:
                (context, List<SoftDrinkProduct> softDrinkproductList, child) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (100 / 140),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: softDrinkproductList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final softDrinkProduct = softDrinkproductList[index];
                  log(softDrinkProduct.name);
                  return GestureDetector(
                    child: SoftDrinkProductCard(
                        softDrinkProduct: softDrinkProduct),
                    onLongPress: () {
                      // deleteSoftDrinkProducts(index);
                      provider.deleteSoftDrinkProductsProvider(index);
                    },
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => SoftDrinkDetailsScreen(
                                softDrinkProduct: softDrinkProduct)),
                      );
                    },
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
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
