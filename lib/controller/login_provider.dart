import 'package:flutter/material.dart';
import 'package:flutter_store_app/view/pages/startup/splash_screen.dart';
import 'package:flutter_store_app/view/widgets/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  Future<void> loginFunction(context) async {
    String userName = userNameController.text.trim();
    String passWord = passWordController.text.trim();
    if (userName == '123' && passWord == '123') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('key', true);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const BottomNavBar()));
    }
  }

  void logOutFunction(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('key', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ),
    );
  }
}
