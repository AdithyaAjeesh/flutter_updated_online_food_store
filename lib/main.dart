import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/burger_model/burger_model.dart';
import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:flutter_store_app/model%20/data/softdrink_model/soft_drink_model.dart';
import 'package:flutter_store_app/view/pages/admin_page/admin_page.dart';
import 'package:flutter_store_app/view/pages/shopping/chart.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_page.dart';
import 'package:flutter_store_app/view/pages/startup/login.dart';
import 'package:flutter_store_app/view/pages/startup/splash_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(BurgerProductAdapter().typeId)) {
    Hive.registerAdapter(BurgerProductAdapter());
  }
  if (!Hive.isAdapterRegistered(BiriyaniProductAdapter().typeId)) {
    Hive.registerAdapter(BiriyaniProductAdapter());
  }
  if (!Hive.isAdapterRegistered(SoftDrinkProductAdapter().typeId)) {
    Hive.registerAdapter(SoftDrinkProductAdapter());
  }
  if (!Hive.isAdapterRegistered(CartItemAdapter().typeId)) {
    Hive.registerAdapter(CartItemAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginPage(),
        '/admin': (context) => const AdminPage(),
        '/drink': (context) => const SoftDrinkPage(),
        '/burger': (context) => const BurgerPage(),
        '/biriyani': (context) => const BiriyaniPage(),
        '/chart': (context) => const ChartPage(),
      },
    );
  }
}
