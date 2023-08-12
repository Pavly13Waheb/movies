import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode? currentTheme;
  String? currentUser;
  static String? userNameLogin;

  void changeLanguage(String lang) async {
    currentLocale = lang;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("lang", lang);
  }

  void changeTheme(ThemeMode theme) async {
    currentTheme = theme;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", theme == ThemeMode.dark ? "dark" : "light");
  }

  void keepMeLogin(String loginUser) async {
    currentUser = loginUser;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", currentUser!);
    print("=====================$currentUser=====================");
  }
}
