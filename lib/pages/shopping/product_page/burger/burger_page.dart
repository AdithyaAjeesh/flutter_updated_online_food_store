import 'package:flutter/material.dart';
import 'package:flutter_store_app/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/functions/burger_functioins.dart';
import 'package:flutter_store_app/functions/chart_functions.dart';
import 'package:flutter_store_app/pages/shopping/product_page/burger/burger_card.dart';
import 'package:flutter_store_app/pages/shopping/product_page/burger/burger_details.dart';

class BurgerPage extends StatefulWidget {
  const BurgerPage({super.key});

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  @override
  Widget build(BuildContext context) {
    List<int> sum = [];
    getAllBurgerProducts();
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
          Expanded(
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
                      deleteBurgerProduct(index);
                    },
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              BurgerDetailsScreen(burgerProduct: burgerProduct),
                        ),
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

double burgerTotalPrice() {
  double total = 0;
  for (var item in burgerProductListNotifier.value) {
    total += double.parse(item.price);
  }
  return total;
}

double burgerTotalCount() {
  double count = 0;
  for (var item in burgerProductListNotifier.value) {
    count += item.quantity;
  }
  return count;
}
