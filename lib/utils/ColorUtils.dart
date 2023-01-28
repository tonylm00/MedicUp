import 'package:flutter/material.dart';
import 'package:momento_medico/utils/AppColors.dart';

class ColorUtils {
  static const Color primaryColor = Color.fromRGBO(0, 75, 70, 1);
  static const Color accentColor = Color.fromARGB(255, 20, 156, 147);
  static const Color gradientEnd = Color.fromARGB(255, 38, 196, 185);
  static const Color gradientStart = Color.fromRGBO(0, 75, 70, 1);
  static const Color themeGradientStart = Color.fromRGBO(0, 75, 70, 1);
  static const Color themeGradientEnd = Color.fromARGB(255, 38, 196, 185);
  static const LinearGradient appBarGradient =
      LinearGradient(colors: [themeGradientStart, themeGradientEnd]);
}
