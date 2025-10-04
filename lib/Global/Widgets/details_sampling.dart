import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class DetailsSampling extends StatelessWidget {
  const DetailsSampling({super.key});

  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 320,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sampling 1", style: styleTitle),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            size: 30,
                            color: AppColors.getColor(ListColors.darkText),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Coordenadas"),
                              Text("-12.046°N"),
                              Text("-70.092°W"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [Text("Aug 31, 2024"), Text("Dec 31, 2024")],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Lider: ", style: TextStyle(fontWeight: FontWeight.w900)),
                Text("Dr Juan Guzman"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Equipo encargado",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text("Equipo alfa Beta Dinamita"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.eye,
                        color: AppColors.getColor(ListColors.darkText),
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Red",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text("Deteccion"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.clock,
                        color: AppColors.getColor(ListColors.darkText),
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "30 dias",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text("Periodo"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
