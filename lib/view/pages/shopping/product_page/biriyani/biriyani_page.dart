import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_details.dart';
import 'package:provider/provider.dart';

class BiriyaniPage extends StatefulWidget {
  const BiriyaniPage({super.key});

  @override
  State<BiriyaniPage> createState() => _BiriyaniPageState();
}

class _BiriyaniPageState extends State<BiriyaniPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    getAllBiriyaniProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biriyani',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: biriyaniProductListNotifier,
              builder:
                  (context, List<BiriyaniProduct> biryaniproductList, child) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 140),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: biryaniproductList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final biriyaniProduct = biryaniproductList[index];

                    return GestureDetector(
                      child:
                          BiriyaniProductCard(biriyaniProduct: biriyaniProduct),
                      onLongPress: () {
                        // deleteBiriyaniProducts(index);
                        provider.deleteBiriyaniProductsProvider(index);
                      },
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BiriyaniDetailsScreen(
                                biriyaniProduct: biriyaniProduct),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

double biriyaniTotalPrice() {
  double total = 0;
  for (var item in biriyaniProductListNotifier.value) {
    total += double.parse(item.price);
  }
  return total;
}

double biriyaniTotalCount() {
  double count = 0;
  for (var item in biriyaniProductListNotifier.value) {
    count += item.quantity;
    count = count + item.quantity;
  }
  return count;
}
