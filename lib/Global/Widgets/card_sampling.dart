import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/Global/Widgets/button.dart';

class CardSampling extends StatelessWidget {
  const CardSampling({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 179,
      width: 340,
      decoration: BoxDecoration(
        gradient: AppGradients.getGradient(ListColors.linearBackground),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            // cambiar a size box porque no le daremos ni bordes ni colores
            height: 129,
            width: 340,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    // color: Colors.amber,
                    height: 129,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("informacion"),
                        Text("Jan 14, 2024"),
                        Text("Encargado: Juan"),
                        Text("Especies vistas: 2"),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    height: 129,
                    width: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.dove,
                          size: 40,
                          color: Colors.black,
                        ),
                        Text("Especies"),
                        Text("2"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: 340,
            // color: Colors.red,
            child: Center(child: Button()),
            // child: Button(),
          ),
        ],
      ),
    );
  }
}
