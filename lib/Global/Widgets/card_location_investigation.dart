import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class CardLocationInvestigation extends StatelessWidget {
  final styleTitle = const TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  const CardLocationInvestigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(25),
        child: Column(
          children: [
            Text("Detalles sobre el sitio", style: styleTitle),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.house,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("detalles"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.leaf,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("detalles"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.mountain,
                        size: 20,
                        color: AppColors.getColor(ListColors.c2),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 10),
                        child: Text("detalles"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
