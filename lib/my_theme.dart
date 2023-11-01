import 'package:flutter/material.dart';

class MyTheme {
  static Color PrimaryLightColor = Color(0xff1A1A1A);
  static Color yellowColor = Color(0xffFFBB3B);
  static Color blackColor = Color(0xff121312);
  static Color whiteColor = Colors.white;
  static Color gryColor = Color(0xff514F4F);

  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );
}
