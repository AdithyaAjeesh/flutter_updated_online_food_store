import 'package:fine_bar_chart/fine_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';
import 'package:flutter_store_app/service/burger_functioins.dart';
import 'package:flutter_store_app/service/soft_drink_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_page.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<double> barValue1 = [
    biriyaniTotalPrice(),
    burgerTotalPrice(),
    softDrinkTotalPrice(),
  ];
  List<double> barValue2 = [
    biriyaniTotalCount(),
    burgerTotalCount(),
    softDrinkTotalCount(),
  ];

  List<Color> barColors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
  ];
  List<String> bottomBarName = [
    "Biriyani",
    "Burger",
    "Soft Drink",
  ];
  @override
  Widget build(BuildContext context) {
    getAllBiriyaniProducts();
    getAllBurgerProducts();
    getAllSoftDrinkProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Price of Items Added by admin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  FineBarChart(
                    barWidth: 30,
                    barHeight: 300,
                    backgroundColors: Colors.white,
                    isBottomNameDisable: false,
                    isValueDisable: false,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    barBackgroundColors: Colors.grey,
                    barValue: barValue1,
                    barColors: barColors,
                    barBottomName: bottomBarName,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Num Items Added by admin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  FineBarChart(
                    barWidth: 30,
                    barHeight: 300,
                    backgroundColors: Colors.white,
                    isBottomNameDisable: false,
                    isValueDisable: false,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    barBackgroundColors: Colors.grey,
                    barValue: barValue2,
                    barColors: barColors,
                    barBottomName: bottomBarName,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
