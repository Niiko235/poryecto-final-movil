import 'package:flutter/material.dart';
import '../Enums/list_colors.dart';
import 'colors_app.dart';

class AppGradients {
  /// Devuelve un LinearGradient según el enum
  static LinearGradient getGradient(ListColors gradientKey) {
    switch (gradientKey) {
      case ListColors.linearBackground:
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5ED2D2),
            Color(0xFF5ED2B7),
          ],
          stops: [0.0, 0.58],
        );

      default:
        // Devolver un degradado "neutro" que use un color plano repetido
        final color = AppColors.getColor(ListColors.c0);
        return LinearGradient(colors: [color, color]);
    }
  }
}
