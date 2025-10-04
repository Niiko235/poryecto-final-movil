import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class DetailsPointSample extends StatelessWidget {
  const DetailsPointSample({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.user,
                      size: 20,
                      color: AppColors.getColor(ListColors.darkText),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Juan"), Text("Jan 23, 2024")],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.arrowTrendUp,
                      size: 20,
                      color: AppColors.getColor(ListColors.darkText),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Condiciones"), Text("Normal")],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Condiciones del ambiente",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 10),
                Icon(
                  FontAwesomeIcons.sun,
                  size: 30,
                  color: AppColors.getColor(ListColors.darkText),
                ),
                Text("Normal"),
                Text("Luminosidad"),
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
                        FontAwesomeIcons.temperatureFull,
                        color: AppColors.getColor(ListColors.darkText),
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "28.5°C",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text("Temperatura"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.droplet,
                        color: AppColors.getColor(ListColors.darkText),
                        size: 30,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Normal",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      Text("Precipitacion"),
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
