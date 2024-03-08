// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_store_app/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/functions/biriyani_functions.dart';
import 'package:flutter_store_app/functions/burger_functioins.dart';
import 'package:flutter_store_app/functions/soft_drink_functions.dart';
import 'package:flutter_store_app/pages/shopping/product_page/biriyani/biriyani_card.dart';
import 'package:flutter_store_app/pages/shopping/product_page/biriyani/biriyani_details.dart';
import 'package:flutter_store_app/pages/shopping/product_page/burger/burger_card.dart';
import 'package:flutter_store_app/pages/shopping/product_page/burger/burger_details.dart';
import 'package:flutter_store_app/pages/shopping/product_page/softDrink/soft_drink_card.dart';
import 'package:flutter_store_app/pages/shopping/product_page/softDrink/soft_drink_details.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  List<dynamic> _allProducts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _getAllProducts();
  }

  Future<void> _getAllProducts({String? query}) async {
    await Future.wait([
      getAllSoftDrinkProducts(),
      getAllBurgerProducts(),
      getAllBiriyaniProducts(),
    ]);
    setState(() {
      _allProducts = [
        ...softDrinkProductListNotifier.value,
        ...burgerProductListNotifier.value,
        ...biriyaniProductListNotifier.value,
      ];

      if (query != null && query.isNotEmpty) {
        _allProducts = _allProducts.where((product) {
          return product.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Search products...',
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
              _getAllProducts(query: value);
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _allProducts.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 100 / 140,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _allProducts.length,
                    itemBuilder: (context, index) {
                      final product = _allProducts[index];
                      return GestureDetector(
                        onTap: () {
                          _navigateToProductDetails(product);
                        },
                        child: _buildProductCard(product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(dynamic product) {
    if (product is SoftDrinkProduct) {
      return SoftDrinkProductCard(softDrinkProduct: product);
    } else if (product is BurgerProduct) {
      return BurgerProductCard(burgerProduct: product);
    } else if (product is BiriyaniProduct) {
      return BiriyaniProductCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  void _navigateToProductDetails(dynamic product) {
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
}
