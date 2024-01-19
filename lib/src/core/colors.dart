import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF7C3807);
  static const Color background = Color(0xFFEEF3FF);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color secondary = Color(0xFFF46702);
  static const Color grey = Color(0xFFD9D9D9);

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      return Color(int.parse('ff$hexColor', radix: 16));
    } else {
      return AppColors.primary;
    }
  }

  static var defaultShadow = BoxShadow(
    color: Colors.grey.shade200,
    spreadRadius: 3,
    blurRadius: 10,
  );
}
