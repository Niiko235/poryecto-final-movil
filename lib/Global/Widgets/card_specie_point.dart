import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/specie.dart';

class CardSpeciePoint extends StatelessWidget {
  final styleTitle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);

  final dynamic data;
  const CardSpeciePoint({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        // Intentamos cargar la primera imagen de la lista
                        '${data['images']?[0] ?? ''}',
                        fit: BoxFit.cover,
                        // Si falla o no existe, mostramos una imagen local
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/image_fail.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data['species'] ?? 'S.N'}", style: styleTitle),
                      Text(
                        "${data['detection'] ?? 'S.D.'}",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text("Conteo: ${data['abundance'] ?? '0'}"),
                      Container(
                        height: 30,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.getColor(ListColors.c0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Specie()),
                            ),
                            child: const Text(
                              "Ver especie",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
