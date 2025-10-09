import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart'; // Necesitas agregar intl a tu pubspec.yaml

// --- Datos JSON del Punto de Muestreo (Clase Superior) ---
final Map<String, dynamic> samplingData = {
  "_id": "688c2c738bddcab4e2c0bd20",
  "date": "2023-01-01T00:00:00.000Z",
  "temperature": 20,
  "relativeHumidity": 50,
  "precipitationState": "Normal",
  "cloudCoverage": 50,
  "luminosity": "Normal",
  "overallConditions": "Bueno",
  "collectedBy": {"uuid": "dc7d7ed8-7e6a-4cef-a73c-4ffdeba82d2f"},
  "samplingPoint": "688c2b4f8bddcab4e2c0bcc2",
  "uuid": "4f6c5858-42dd-4ac2-b50d-825f7d011b99",
  "createdAt": "2025-08-01T02:54:43.492Z",
  "updatedAt": "2025-08-01T02:54:43.492Z",
  "observedSpecies": [], // Tu JSON real contendría la lista de especies aquí
};
// --------------------------------------------------------

class SampligPoint extends StatelessWidget {
  const SampligPoint({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracción y formateo de datos
    // final DateTime date = DateTime.parse(samplingData['date']);
    // final String formattedDate = DateFormat(
    //   'MMM dd, yyyy',
    //   'es',
    // ).format(date).replaceAll('.', ''); // Ene 01, 2023
    final String formattedDate = 'Ene 01, 2023'; // Fecha fija para el mockup
    final double temperature = samplingData['temperature'].toDouble();
    final String luminosity = samplingData['luminosity'];
    final String precipitation = samplingData['precipitationState'];
    final String overallConditions = samplingData['overallConditions'];
    final int relativeHumidity = samplingData['relativeHumidity'];
    final int cloudCoverage = samplingData['cloudCoverage'];

    // Define el color principal de la aplicación (verde oscuro del mockup)
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
                  _buildConditionsCard(
                    date: formattedDate,
                    temperature: temperature,
                    luminosity: luminosity,
                    precipitation: precipitation,
                    overallConditions: overallConditions,
                    relativeHumidity: relativeHumidity,
                    cloudCoverage: cloudCoverage,
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
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See more',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Lista de Especies Observadas (Placeholder)
                  _buildSpeciesPlaceholder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widgets de Ayuda ---

  // Card principal con las condiciones ambientales
  Widget _buildConditionsCard({
    required String date,
    required double temperature,
    required String luminosity,
    required String precipitation,
    required String overallConditions,
    required int relativeHumidity,
    required int cloudCoverage,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row superior (Usuario y Condición General)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 24),
                    const SizedBox(width: 8),
                    // Usamos un nombre de usuario de ejemplo, ya que el JSON solo tiene el UUID
                    Text('Juan\n$date', style: const TextStyle(fontSize: 14)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.show_chart, size: 24),
                    const SizedBox(width: 4),
                    Text(
                      'Condiciones\n${overallConditions}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),

            const Divider(height: 30),

            // Título Condiciones del Ambiente
            const Text(
              'Condiciones del ambiente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildConditionIndicator(
                  icon: Icons.wb_sunny,
                  value: luminosity,
                  label: 'Luminosidad',
                ),
                _buildConditionIndicator(
                  icon: Icons.thermostat_outlined,
                  value: '${temperature}°C',
                  label: 'Temperatura',
                ),
                _buildConditionIndicator(
                  icon: Icons.opacity,
                  value: precipitation,
                  label: 'Precipitación',
                ),
              ],
            ),

            const SizedBox(height: 20), // Espacio entre filas
            // SEGUNDA FILA: Humedad y Cobertura de Nubes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildConditionIndicator(
                  icon: Icons.water_drop_outlined,
                  value: '$relativeHumidity%',
                  label: 'Humedad Rel.',
                ),
                _buildConditionIndicator(
                  icon: Icons.cloud_outlined,
                  value: '$cloudCoverage%',
                  label: 'Cobertura Nubes',
                ),
                // Usamos un widget vacío para forzar la alineación
                const SizedBox(
                  width: 80,
                ), // Alinea con el tercer indicador de la fila de arriba
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para cada indicador de condición (Luminosidad, Temp, Precip.)
  Widget _buildConditionIndicator({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.black54),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  // Placeholder para la lista de especies (simulando las cards del mockup)
  Widget _buildSpeciesPlaceholder() {
    return Column(
      children: [
        // Card 1: Blue Morpho Butterfly (Simulada)
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          color: const Color(
            0xFFE0F7FA,
          ), // Color de fondo claro similar al mockup
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen simulada
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.green[300],
                    child: const Center(
                      child: Icon(Icons.image, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Blue Morpho Butterfly',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Morpho peleides',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        'Nymphalidae',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Conteo: 3',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      // Botón
                      SizedBox(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF00796B)),
                          ),
                          child: const Text(
                            'Ver especie',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF00796B),
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
        // Card 2: Scarlet Macaw (Simulada)
        Card(
          margin: const EdgeInsets.only(bottom: 12),
          color: const Color(0xFFE0F7FA),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.red[300],
                    child: const Center(
                      child: Icon(Icons.image, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Scarlet Macaw',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Ara Macao',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        'Psitaidae',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Conteo: 2',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF00796B)),
                          ),
                          child: const Text(
                            'Ver más detalles',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF00796B),
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
      ],
    );
  }
}
