import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class CardGoalsProject extends StatelessWidget {
  final styleTitle = const TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  const CardGoalsProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 320,
      decoration: BoxDecoration(
        color: AppColors.getColor(ListColors.c0),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Objetivos", style: styleTitle),
                  Text(
                    "Descripcion del estudio en cuestion de que trate esta sección",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Resultados", style: styleTitle),
                  Text(
                    "Descripcion del estudio en cuestion de que trate esta sección",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
