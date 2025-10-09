import 'package:flutter/material.dart';
import '../Enums/list_colors.dart';

class AppColors {
  static Color getColor(ListColors color) {
    switch (color) {
      case ListColors.c1:
        return const Color(0xFF5ED2B7);
      case ListColors.c2:
        return const Color(0xFF41BA9D);
      case ListColors.c0:
        return const Color(0xFFF6FBFA);
      case ListColors.action:
        return const Color(0xFF00916E);
      case ListColors.darkText:
        return const Color(0xFF002B20);
      case ListColors.gray:
        return const Color(0xFF888888);
      case ListColors.linearBackground:
        return const Color(0xFF5ED2D2); // Color plano si no quiere el gradiente
    }
  }
}
