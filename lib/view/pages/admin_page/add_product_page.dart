import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/add_product_provider.dart';
import 'package:flutter_store_app/view/pages/shopping/chart.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProductPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChartPage(),
                ),
              );
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextField(
                controller: provider.nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter product name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.priceController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Price',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.disceriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Discription',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.catagoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Catagory',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.pickImageFromGallery();
                },
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  provider.addProduct(context);
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
