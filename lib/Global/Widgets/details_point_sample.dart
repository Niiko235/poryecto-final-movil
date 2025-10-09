import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class DetailsPointSample extends StatelessWidget {
  const DetailsPointSample({
    super.key,
    required this.date,
    required this.temperature,
    required this.luminosity,
    required this.overallConditions,
    required this.precipitation,
  });

  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);

  final dynamic date;
  final dynamic temperature;
  final dynamic luminosity;
  final dynamic overallConditions;
  final dynamic precipitation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 320,
      decoration: BoxDecoration(
        color: AppColors.getColor(ListColors.c0),
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
                      children: [Text("Juan"), Text("$date")],
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
                      children: [
                        Text("Condiciones"),
                        Text("$overallConditions"),
                      ],
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
                Text("$luminosity"),
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
                        "$temperature°C",
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
                        "$precipitation",
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
