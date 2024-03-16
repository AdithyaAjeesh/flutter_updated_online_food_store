import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/all_products_provider.dart';
import 'package:flutter_store_app/controller/edit_product_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProductPage extends StatelessWidget {
  const EditProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProductProvider>(context);
    final editProvider = Provider.of<EditProductProvider>(context);

    provider.getAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Products'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 100 / 140,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: provider.allProducts.length,
              itemBuilder: (context, index) {
                final product = provider.allProducts[index];
                return GestureDetector(
                  onTap: () {
                    editProvider.deleteAnyProductProvider(product, index);
                   
                  },
                  onLongPress: () {},
                  child: editProvider.buildProductCard(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BurgerEditCard extends StatelessWidget {
  final BurgerProduct burgerProduct;
  const BurgerEditCard({super.key, required this.burgerProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 134, 128, 128).withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              burgerProduct.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            burgerProduct.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$ ${burgerProduct.price}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.redAccent),
          ),
          const SizedBox(height: 10),
          const Text('tap to edit'),
          const SizedBox(height: 10),
          const Text('Long press to delete')
        ],
      ),
    );
  }
}

class BiriyaniEditCard extends StatelessWidget {
  final BiriyaniProduct biriyaniProduct;
  const BiriyaniEditCard({super.key, required this.biriyaniProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 134, 128, 128).withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              biriyaniProduct.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            biriyaniProduct.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$ ${biriyaniProduct.price}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.redAccent),
          ),
          const SizedBox(height: 10),
          const Text('tap to edit'),
          const SizedBox(height: 10),
          const Text('Long press to delete')
        ],
      ),
    );
  }
}

class SoftDrinkEditCard extends StatelessWidget {
  final SoftDrinkProduct softDrinkProduct;
  const SoftDrinkEditCard({super.key, required this.softDrinkProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 134, 128, 128).withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              softDrinkProduct.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            softDrinkProduct.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$ ${softDrinkProduct.price}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.redAccent),
          ),
          const SizedBox(height: 10),
          const Text('tap to edit'),
          const SizedBox(height: 10),
          const Text('Long press to delete')
        ],
      ),
    );
  }
}
