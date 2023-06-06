import 'package:flutter/material.dart';
import 'app_material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorLight: AppColor.grayColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.grayColor, fontSize: 25),
      bodySmall: TextStyle(color: AppColor.grayColor, fontSize: 15),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      color: AppColor.grayColor,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.navBarColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColor.darkYellowColor,
      selectedLabelStyle: TextStyle(color: AppColor.grayColor, fontSize: 25),
      unselectedLabelStyle: TextStyle(color: AppColor.grayColor, fontSize: 15),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorDark: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.grayColor, fontSize: 25),
      bodySmall: TextStyle(fontSize: 20, color: AppColor.grayColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.whiteColor,
      titleTextStyle: TextStyle(
          color: AppColor.grayColor, fontSize: 30, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.navBarColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColor.darkYellowColor,
    ),
  );
}
