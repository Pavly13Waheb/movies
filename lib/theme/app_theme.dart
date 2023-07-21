import 'package:flutter/material.dart';
import 'app_material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.whiteColor),
    primaryColorLight: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.greyColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.blackColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.blackColor, fontSize: 25),
      bodySmall: TextStyle(color: AppColor.blackColor, fontSize: 15),
      labelSmall: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 15,
        overflow: TextOverflow.fade,
      ),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 30,
      centerTitle: true,
      color: AppColor.whiteColor,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: AppColor.greyColor, fontSize: 25, fontWeight: FontWeight.bold),
      shape: const RoundedRectangleBorder(
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
      selectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 13),
      unselectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 10),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorDark: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.whiteColor, fontSize: 25),
      bodySmall: TextStyle(fontSize: 20, color: AppColor.greyColor),
      labelSmall: TextStyle(color: AppColor.whiteColor, fontSize: 15),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 30,
      centerTitle: true,
      color: AppColor.greyColor,
      shadowColor: Colors.transparent,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      shape: const RoundedRectangleBorder(
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
      selectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 13),
      unselectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 10),
    ),
  );
}
