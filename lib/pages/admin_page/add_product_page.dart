import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/functions/biriyani_functions.dart';
import 'package:flutter_store_app/functions/burger_functioins.dart';
import 'package:flutter_store_app/functions/soft_drink_functions.dart';
import 'package:flutter_store_app/pages/shopping/chart.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final nameController = TextEditingController();
  final catagoryController = TextEditingController();
  final disceriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ChartPage()));
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
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter product name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Price',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: disceriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Discription',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: catagoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Catagory',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  pickImageFromGallery();
                },
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  selectedCatagory();
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    } else {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<void> selectedCatagory() async {
    final catagory = catagoryController.text.trim();
    if (catagory == 'burger') {
      onAddBurgerProduct();
    } else if (catagory == 'biriyani') {
      onAddBiriyaniProduct();
    } else if (catagory == 'softdrink') {
      onAddSoftDrinkProduct();
    }
  }

  Future<void> onAddBurgerProduct() async {
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final discription = disceriptionController.text.trim();
    if (name.isNotEmpty || price.isNotEmpty || discription.isNotEmpty) {
      final burgerproduct = BurgerProduct(
          id: 1,
          name: name,
          catagory: '',
          image: image!.path,
          description: discription,
          price: price,
          quantity: 1);
      addBurgerProduct(burgerproduct);

      Navigator.of(context).pop();
    } else {
      return;
    }
  }

  Future<void> onAddBiriyaniProduct() async {
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final discription = disceriptionController.text.trim();
    if (name.isNotEmpty || price.isNotEmpty || discription.isNotEmpty) {
      final biriyaniproduct = BiriyaniProduct(
          id: 1,
          name: name,
          catagory: '',
          image: image!.path,
          description: discription,
          price: price,
          quantity: 1);
      addBiriyaniProduct(biriyaniproduct);
      Navigator.of(context).pop();
    } else {
      return;
    }
  }

  Future<void> onAddSoftDrinkProduct() async {
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final discription = disceriptionController.text.trim();
    if (name.isNotEmpty || price.isNotEmpty || discription.isNotEmpty) {
      final softDrinkproduct = SoftDrinkProduct(
          id: 1,
          name: name,
          catagory: '',
          image: image!.path,
          description: discription,
          price: price,
          quantity: 1);
      addSoftDrinkProduct(softDrinkproduct);
      Navigator.of(context).pop();
    } else {
      return;
    }
  }
}
