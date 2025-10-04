import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class CardDetailsProject extends StatelessWidget {
  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);

  const CardDetailsProject({super.key});

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
        padding: EdgeInsetsGeometry.only(
          left: 25,
          top: 25,
          right: 25,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Detalles", style: styleTitle),
            Text(
              "Descrición del estudio en cuestion de que trate esta sección",
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 135,
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          size: 20,
                          color: AppColors.getColor(ListColors.c1),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Location"),
                                Text("Amazon basin, Brazil"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 135,
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendar,
                          size: 20,
                          color: AppColors.getColor(ListColors.c1),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsGeometry.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Duration"),
                                Text("Jan 14, 2024 - ongogin"),
                              ],
                            ),
                          ),
                        ),
                      ],
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
}
