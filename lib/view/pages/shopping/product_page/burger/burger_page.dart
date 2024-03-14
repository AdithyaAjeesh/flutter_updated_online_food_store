import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/service/burger_functioins.dart';
import 'package:flutter_store_app/service/chart_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_details.dart';
import 'package:provider/provider.dart';

class BurgerPage extends StatelessWidget {
  const BurgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.getAllBurgerProductsProvider();
    List<int> sum = [];
    // getAllBurgerProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Burger',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: Column(
        children: [
          Consumer<ProductProvider>(builder: (context, provider, child) {
            return Expanded(
                child: ValueListenableBuilder(
              valueListenable: burgerProductListNotifier,
              builder: (context, List<BurgerProduct> burgerproductList, child) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 140),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: burgerproductList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final burgerProduct = burgerproductList[index];
                    sum.add(int.tryParse(burgerProduct.price)!.toInt());
                    double totalBurger = sum
                        .reduce((value, element) => value + element)
                        .toDouble();
                    ChartFunctions.totalBurger = totalBurger;

                    return GestureDetector(
                      child: BurgerProductCard(burgerProduct: burgerProduct),
                      onLongPress: () {
                        // deleteBurgerProduct(index);
                        provider.deleteBurgerProductProvider(index);
                      },
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BurgerDetailsScreen(
                                burgerProduct: burgerProduct),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ));
          })
        ],
      ),
    );
  }
}
