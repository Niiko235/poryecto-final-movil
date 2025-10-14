import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/sampling.dart';

class CardSamplingInvestigation extends StatelessWidget {
  const CardSamplingInvestigation({super.key, required this.data});

  final dynamic data;

  final styleTitle = const TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  @override
  Widget build(BuildContext context) {
       String formattedDate;
        try {
          formattedDate = DateFormat(
            'MMM dd, yyyy',
          ).format(DateTime.parse(data['startDate']));
        } catch (e) {
          formattedDate = 'Fecha N/A';
        }
    return Container(
      padding: EdgeInsets.all(10),
      // width: 340,
      // height: 225,
      decoration: BoxDecoration(
        color: AppColors.getColor(ListColors.c0),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Row(
          children: [
            Expanded(
              // width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Punto de muestreo: ${data['pointNumber'] ?? '--'}",
                    style: styleTitle,
                  ),
                  SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        FontAwesomeIcons.list,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Expanded(
                        // padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("${data['samplingType'] ?? '--'}", softWrap: true),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Expanded(
                        // padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("${formattedDate}"),
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
                        child: Text("${data['samples']?.length ?? '0'}"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Lat: ${data['coordinates']?['latitude'] ?? '--'}", overflow: TextOverflow.ellipsis,),
                  Text("Lon: ${data['coordinates']?['longitude'] ?? '--'}", overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            SizedBox(
              width: 90,
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTag('${data['detection'] ?? '--'}'),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.getColor(ListColors.action),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sampling(data: data,),
                        ),
                      ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 20,
                            color: AppColors.getColor(ListColors.c0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  _buildTag(String s) {
    final sLower = s.toLowerCase();
    Color backGroundColor;
    Color textColor;

    switch (sLower) {
      case 'red':
        backGroundColor = Colors.cyan.shade100;
        textColor = Colors.cyan.shade800;
        break;
      case 'visual':
        backGroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      default:
        backGroundColor = Colors.blue.shade300;
        textColor = Colors.blue.shade900;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        s,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
