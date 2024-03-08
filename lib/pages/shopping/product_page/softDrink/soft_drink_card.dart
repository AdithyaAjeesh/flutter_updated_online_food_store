import 'package:flutter/material.dart';
import 'package:flutter_store_app/data/softdrink_model/soft_drink_model.dart';

class SoftDrinkProductCard extends StatefulWidget {
  final SoftDrinkProduct softDrinkProduct;
  const SoftDrinkProductCard({super.key, required this.softDrinkProduct});

  @override
  State<SoftDrinkProductCard> createState() => _SoftDrinkProductCardState();
}

class _SoftDrinkProductCardState extends State<SoftDrinkProductCard> {
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
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),   
            height: 130,
            width: 130,
            child: Image.asset(
              widget.softDrinkProduct.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.softDrinkProduct.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$ ${widget.softDrinkProduct.price}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.redAccent),
          )
        ],
      ),
    );
  }
}
