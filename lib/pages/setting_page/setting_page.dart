import 'package:flutter/material.dart';

import 'package:flutter_store_app/pages/startup/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('key', false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SplashScreen()));
            },
            icon: const Icon(Icons.login),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          _buildListMainItem(text: 'available features'),
          _buildListItem(text: 'Admin', ro: '/admin'),
          _buildListItem(text: 'Chart', ro: '/chart'),
        ],
      ),
    );
  }

  _buildListMainItem({required String text}) => Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 170, 59),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  _buildListItem({required String text, required String ro}) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ro);
        },
        child: Container(
          width: double.infinity,
          height: 80,
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 230, 205, 174),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}