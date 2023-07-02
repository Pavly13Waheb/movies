import 'package:flutter/material.dart';
import 'app_material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorLight: AppColor.greyColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.greyColor, fontSize: 25),
      bodySmall: TextStyle(color: AppColor.greyColor, fontSize: 15),
      labelSmall: TextStyle(color: AppColor.whiteColor, fontSize: 15,
        overflow: TextOverflow.fade,),
    ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      color: AppColor.whiteColor,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: AppColor.greyColor, fontSize: 30, fontWeight: FontWeight.bold),
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
      selectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 25),
      unselectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 15),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(background: AppColor.blackColor),
    primaryColorDark: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.blackColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.whiteColor, fontSize: 30),
      bodyMedium: TextStyle(color: AppColor.greyColor, fontSize: 25),
      bodySmall: TextStyle(fontSize: 20, color: AppColor.greyColor),
  labelSmall: TextStyle(color: AppColor.whiteColor, fontSize: 15),

  ),
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      color: AppColor.greyColor,
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
    ),
  );
}
