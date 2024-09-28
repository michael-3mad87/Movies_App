import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff121312);
  static const Color grey = Color(0xff282A28);
  static const Color bottomNavColor = Color(0xff1A1A1A);
  static const Color white = Color(0xffffffff);
  static const Color gold = Color(0xffFFBB3B);
  static const Color bookMarkColor = Color(0xffF7B539);
  static const Color unselectedColor = Color(0xffB5B4B4);
  static const Color darkGrey = Color(0xff514F4F);
  static const Color movieListColor = Color(0xff343534);
  static const Color appBarColor = Color(0xff1D1E1D);
  static const Color borderColor = Color(0xff514F4F);
  static const Color textGenreColor = Color(0xffCBCBCB);
  static const Color searchAppColor = Color(0xff514F4F);
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: gold,
      unselectedItemColor: unselectedColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: bottomNavColor,
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: white)),
    textTheme: const TextTheme(
      titleMedium:
          TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w400),
    ),
  );
}
