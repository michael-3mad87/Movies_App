import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff121312);
  static const Color grey = Color(0xff282A28);
  static const Color bottomNavColor = Color(0xff1A1A1A);
  static const Color white = Color(0xffffffff);
  static const Color gold = Color(0xffFFBB3B);
  static const Color searchColor = Color(0xff514F4F);
  static const Color unselectedColor = Color(0xffB5B4B4);
  static  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primary,
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        selectedItemColor: gold,
        unselectedItemColor: unselectedColor,
        type: BottomNavigationBarType.fixed,
         showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: bottomNavColor,
    )
  );
  
}
