import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_specie_point.dart';
import 'package:proyecto_final_movil/Global/Widgets/details_point_sample.dart'; // Necesitas agregar intl a tu pubspec.yaml

// --- Datos JSON del Punto de Muestreo (Clase Superior) ---
// final Map<String, dynamic> samplingData = {
//   "_id": "688c2c738bddcab4e2c0bd20",
//   "date": "2023-01-01T00:00:00.000Z",
//   "temperature": 20,
//   "relativeHumidity": 50,
//   "precipitationState": "Normal",
//   "cloudCoverage": 50,
//   "luminosity": "Normal",
//   "overallConditions": "Bueno",
//   "collectedBy": {"uuid": "dc7d7ed8-7e6a-4cef-a73c-4ffdeba82d2f"},
//   "samplingPoint": "688c2b4f8bddcab4e2c0bcc2",
//   "uuid": "4f6c5858-42dd-4ac2-b50d-825f7d011b99",
//   "createdAt": "2025-08-01T02:54:43.492Z",
//   "updatedAt": "2025-08-01T02:54:43.492Z",
//   "observedSpecies": [], // Tu JSON real contendría la lista de especies aquí
// };
// --------------------------------------------------------

class SampligPoint extends StatelessWidget {
  final dynamic data;

  const SampligPoint({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = 'Ene 01, 2023'; // Fecha fija para el mockup
    final double temperature = data['temperature'].toDouble();
    final String luminosity = data['luminosity'];
    final String precipitation = data['precipitationState'];
    final String overallConditions = data['overallConditions'];

    const Color primaryColor = Color(0xFF00796B);

    return Scaffold(
      // La AppBar utiliza el color principal
      appBar: AppBar(
        title: const Text(
          'Punto de muestreo físico',
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
      // Usa un Stack para colocar el fondo curvado detrás del contenido
      body: Stack(
        children: [
          // 1. Fondo Curvado
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
                  Center(
                    child: DetailsPointSample(
                      date: formattedDate,
                      temperature: temperature,
                      luminosity: luminosity,
                      precipitation: precipitation,
                      overallConditions: overallConditions,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Sección Especies Observadas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Especies observadas',
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
                      children: _listItemsJson(
                        data['observedSpecies'] ?? [],
                        context,
                      ),
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
      final tmpWidget = CardSpeciePoint(data: items);
      listaJson
        ..add(Center(child: tmpWidget))
        ..add(SizedBox(height: 10));
    });

    return listaJson;
  }
}
