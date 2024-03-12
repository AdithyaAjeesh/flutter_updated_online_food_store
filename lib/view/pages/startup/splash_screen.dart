import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/view/pages/startup/login.dart';
import 'package:flutter_store_app/view/widgets/bottom_navbar.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  Future<void> checkLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLoggedIn = pref.getBool('key') ?? false;
    if (isLoggedIn == true) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomNavBar()));
      });
    } else if (isLoggedIn == false) {
      Timer(const Duration(seconds: 2), () {});
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Food',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(color: Colors.black),
                child: const Text(
                  'HUB',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 170, 59),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
