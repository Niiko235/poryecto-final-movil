import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_point_sample_sampling.dart';
import 'package:proyecto_final_movil/Global/Widgets/details_sampling.dart';

class Sampling extends StatelessWidget {
  final dynamic data;

  const Sampling({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // La AppBar utiliza el color principal
      appBar: AppBar(
        title: const Text(
          'Muestreo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.getColor(
          ListColors.action,
        ), // Color de fondo verde oscuro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),

      body: Stack(
        children: [
          Container(
            height: 160, // Altura para cubrir la Card de Ambiente
            decoration: const BoxDecoration(
              color: Color(0xFF00916E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40), // Curva similar al mockup
                bottomRight: Radius.circular(40), // Curva similar al mockup
              ),
            ),
          ),

          // 2. Contenido Principal (Scrollable)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card de Condiciones del Ambiente
                  Center(child: DetailsSampling()),

                  const SizedBox(height: 24),

                  // Sección Especies Observadas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Puntos de muestro fisico',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Column(
                      children: _listItemsJson(data['samples'] ?? [], context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listItemsJson(List<dynamic> data, BuildContext context) {
    List<Widget> listaJson = [];
    data.forEach((items) {
      final tmpWidget = CardPointSampleSampling(data: items);
      listaJson
        ..add(Center(child: tmpWidget))
        ..add(SizedBox(height: 10));
    });

    return listaJson;
  }
}
