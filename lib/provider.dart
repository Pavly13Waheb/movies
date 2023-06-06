import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppProvider extends ChangeNotifier{

  String currentLocale = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeLanguage(String lang) async {
    currentLocale = lang;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  changeTheme(ThemeMode theme) async {
    currentTheme = theme;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", theme == ThemeMode.light ? "light" : "dark");
  }



}