import 'package:flutter/material.dart';
import 'package:movies_app/core/AppColor/color.dart';
const Color primaryYellow = Color(0xFFFFC000);
const Color darkBackground = Color(0xFF1E1E1E);
const Color inputFieldColor = Color(0xFF333333);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackground,
  primaryColor: primaryYellow,
  hintColor: Colors.white54,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: primaryYellow,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: inputFieldColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: primaryYellow, width: 2.0),
    ),
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: const TextStyle(color: Colors.white54),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryYellow,
      foregroundColor: darkBackground,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
    labelLarge: TextStyle(color: darkBackground, fontSize: 16, fontWeight: FontWeight.w500),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: AppColor.yellow,
      size: 30,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColor.white,
      size: 30,
    ),
  ),


);