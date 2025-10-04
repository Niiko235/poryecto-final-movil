import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/Global/Widgets/button_row.dart';

class CardSamplingInvestigation extends StatelessWidget {
  const CardSamplingInvestigation({super.key});

  final styleTitle = const TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 225,
      decoration: BoxDecoration(
        color: AppColors.getColor(ListColors.c0),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Row(
          children: [
            SizedBox(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Punto de muestro: 1", style: styleTitle),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.list,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("Punto de captura"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("Aug 31, 2024"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.vial,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("3 muestras"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("latitud"),
                  Text("longitud"),
                ],
              ),
            ),
            SizedBox(
              width: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("etiqueta"), ButtonRow()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
