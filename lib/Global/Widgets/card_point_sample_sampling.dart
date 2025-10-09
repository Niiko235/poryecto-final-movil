import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/samplig_point.dart';

class CardPointSampleSampling extends StatelessWidget {
  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);

  final dynamic data;
  const CardPointSampleSampling({super.key, required this.data});

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
          SizedBox(
            // cambiar a size box porque no le daremos ni bordes ni colores
            height: 129,
            width: 340,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 15),
                    child: SizedBox(
                      // color: Colors.amber,
                      height: 129,
                      width: 185,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6.0),
                            child: Text("Observación", style: styleTitle),
                          ),
                          Text(
                            "${data['date']}",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text("Encargado: Juan"),
                          Text(
                            "Especies vistas: ${data['observedSpecies']?.length ?? '0'}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
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
                        Text(
                          "Especies",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${data['observedSpecies']?.length ?? '0'}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 340,
            // color: Colors.red,
            child: Center(
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.getColor(ListColors.c0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SampligPoint(data: data),
                      ),
                    ),
                    child: const Text(
                      "Ver más detalles",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // child: Button(),
          ),
        ],
      ),
    );
  }
}
