import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class DetailsSampling extends StatelessWidget {
  const DetailsSampling({super.key, required this.data});
  final dynamic data;
  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);

  @override
  Widget build(BuildContext context) {
    String startDate, endDate;
    try {
      startDate = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(data['startDate']));

      endDate = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(data['endDate']));
    } catch (e) {
      startDate = 'Fecha N/A';
      endDate = 'Fecha N/A';
    }

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
              children: [
                SizedBox(
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Punto ${data['pointNumber']}", style: styleTitle),
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
                              Text("${data['coordinates']?['latitude']} °N"),
                              Text("${data['coordinates']?['longitude']} °W"),
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
                    children: [Text("$startDate"), Text("$endDate")],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Tipo de muestra", style: TextStyle(fontWeight: FontWeight.w900)),
                Text("${data['samplingType']}"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detalles de la muestra",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    Text("${data['detailSamplingType'] ?? 'No hay más detalles de la muestra.'}"),
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
                        "${data['detection']}",
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
                        "${data['censusPeriod']} dias",
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
