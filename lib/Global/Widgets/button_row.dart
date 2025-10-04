import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.getColor(ListColors.c2),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: TextButton(
          onPressed: () => print("Presionando boton xd"),
          child: Center(
            child: Icon(
              FontAwesomeIcons.arrowRight,
              size: 20,
              color: AppColors.getColor(ListColors.c0),
            ),
          ),
        ),
      ),
    );
  }
}
