import 'package:flutter/material.dart';

class AppColors {
  static const Color medicUpColor = Color.fromRGBO(00, 75, 70, 1);
  static const Color lightGray = Color(0xffe0e0e0);
  static const Color lighterGray = Color(0xfffafafa);
  static const Color backgroundLight = Color(0xffffffff);

  MaterialColor primaryColor =
      const MaterialColor(0x18004B46, AppSizes.colorCodesThemePrimary);
}

class AppSizes {
  static const Map<int, Color> colorCodesThemePrimary = {
    50: Color.fromRGBO(0, 75, 70, .1),
    100: Color.fromRGBO(00, 75, 70, .2),
    200: Color.fromRGBO(00, 75, 70, .3),
    300: Color.fromRGBO(00, 75, 70, .4),
    400: Color.fromRGBO(00, 75, 70, .5),
    500: Color.fromRGBO(00, 75, 70, .6),
    600: Color.fromRGBO(00, 75, 70, .7),
    700: Color.fromRGBO(00, 75, 70, .8),
    800: Color.fromRGBO(00, 75, 70, .9),
    900: Color.fromRGBO(00, 75, 70, 1),
  };
}

class TextPresets {
  /*  static const TextStyle dashboardCardTitle = TextStyle(
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor); */
}

class AppStrings {}
