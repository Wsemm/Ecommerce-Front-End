import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
    appBarTheme: const AppBarTheme(color: AppColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: "Cairo",
      fontSize: 20,
      fontWeight: FontWeight.bold)),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
    fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold, height: 2, color: AppColor.grey),
    ));

ThemeData themeArabic = ThemeData(
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.bold, height: 2, color: AppColor.grey),
    ));
