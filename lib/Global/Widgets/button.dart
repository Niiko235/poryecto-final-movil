import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.getColor(ListColors.c0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextButton(
          onPressed: () => print("Presionando boton xd"),
          child: const Text(
            "Ver mas detalles",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
