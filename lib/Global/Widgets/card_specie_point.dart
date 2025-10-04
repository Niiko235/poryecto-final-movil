import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/Global/Widgets/Button_point.dart';

class CardSpeciePoint extends StatelessWidget {
  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  const CardSpeciePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 179,
      width: 340,
      decoration: BoxDecoration(
        gradient: AppGradients.getGradient(ListColors.linearBackground),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 129,
            width: 340,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiHAHSoIm_cTbXq5WzvqhOhSXJfy__fj3NiA&s",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Blue Morpho Butterfly", style: styleTitle),
                      Text(
                        "Blue Morpho Butterfly",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text("Blue Morpho Butterfly"),
                      Text("Conteo: 3"),
                      ButtonPoint(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
