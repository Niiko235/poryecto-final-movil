import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/Data/Remote/image_remote.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/specie.dart';

class CardSpeciePoint extends StatelessWidget {
  final dynamic data;
  const CardSpeciePoint({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Specie()),
        );
      },
      child: Container(
        height: 160,
        width: 340,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: AppGradients.getGradient(ListColors.linearBackground),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // 🖼 Imagen con sombra y bordes redondeados
              Container(
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ImageRemote(
                    imageUrl: '${data['images']?[0] ?? ''}',
                    width: 100,
                    height: 129,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              // 📋 Información
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data['species'] ?? 'Especie no identificada'}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.eye,
                          size: 18,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Detección: ${data['detection'] ?? 'Sin detección'}",
                          style: const TextStyle(
                            // fontStyle: FontStyle.italic,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.list,
                          size: 18,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Conteo: ${data['abundance'] ?? '0'}",
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // 🔘 Botón estilizado
                    SizedBox(
                      height: 36,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.getColor(ListColors.c0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Specie(),
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                        label: const Text(
                          "Ver especie",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
