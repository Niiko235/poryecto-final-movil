import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

// --- Datos JSON de la Guacamaya (Usarías un modelo real aquí) ---
final Map<String, dynamic> guacamayaData = {
  "_id": "688c2c838bddcab4e2c0bd2a",
  "species": "Guacamaya",
  "abundance": 5,
  "detection": "Captura-red",
  "distance": 10.5,
  "males": 2,
  "females": 3,
  "UndeterminedSexCount": 0,
  "numberAdults": 4,
  "JuvenileCount": 1,
  "activity": "Canto",
  "substrate": "Arboreo",
  "stratum": "Aereo",
  "observation": "Individuo posado en rama alta",
  "morphology": {
    "billLength": 10.2,
    "wingChord": 1.0,
    "tarsusLength": 3.0,
    "tailLength": 4.0,
    "totalLength": 2.0,
    "_id": "688c2c838bddcab4e2c0bd2b",
  },
  "images": [
    "https://api-bird-field-logs.coderhub.run/public/species/584ef8dd-ffdc-472c-84f7-b1d4541f98b7.jpg",
    "https://api-bird-field-logs.coderhub.run/public/species/82171fa6-7d65-4823-93ea-df26a941cf54.jpg",
    "https://api-bird-field-logs.coderhub.run/public/species/408a112d-e392-4fbc-911b-2bb70282d519.jpg",
  ],
  "sample": "688c2c738bddcab4e2c0bd20",
  "uuid": "afd7d1d8-62cc-4fe6-bdcb-d8e56b0a7932",
  "createdAt": "2025-08-01T02:54:59.749Z",
  "updatedAt": "2025-08-01T02:54:59.749Z",
};
// -----------------------------------------------------------------

class Specie extends StatelessWidget {
  const Specie({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracción de datos para fácil acceso
    final String speciesName =
        guacamayaData['species'] ?? 'Especie Desconocida';
    final List<String> images = List<String>.from(
      guacamayaData['images'] ?? [''],
    );
    final Map<String, dynamic> morphology = guacamayaData['morphology'] ?? {};

    return Scaffold(
      // Estilo de AppBar similar al mockup
      appBar: AppBar(
        title: const Text(
          'Información de la especie',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        backgroundColor: AppColors.getColor(
          ListColors.action,
        ), // Color de fondo verde oscuro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // Cuerpo deslizable para todo el contenido
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 36.0, right: 36.0),
        child: ListView(
          children: [
            // 1. Carrusel de Imágenes (PageView)
            _buildImageCarousel(images, speciesName),

            // 2. Título de la Especie y tags
            Text(
              speciesName,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                _buildTag(guacamayaData['detection'] ?? ''), // Captura-red
                _buildTag(guacamayaData['stratum'] ?? ''), // Aereo
              ],
            ),
            const SizedBox(height: 24),

            // 3. Descripción y Observación
            _buildSectionTitle('Descripción del Avistamiento'),
            _buildDetailText(
              'Observación: ',
              guacamayaData['observation'] ?? '',
            ),
            _buildDetailText('Actividad: ', guacamayaData['activity'] ?? ''),
            _buildDetailText('Sustrato: ', guacamayaData['substrate'] ?? ''),

            const SizedBox(height: 24),

            // 4. Detalles del Censo
            _buildSectionTitle('Detalles del Censo'),
            _buildDetailText(
              'Abundancia Total: ',
              '${guacamayaData['abundance']} individuos',
            ),
            _buildDetailText(
              'Distancia: ',
              '${guacamayaData['distance']} metros',
            ),
            _buildSubSectionTitle('Composición por Sexo'),
            _buildDetailText('Machos: ', '${guacamayaData['males']}'),
            _buildDetailText('Hembras: ', '${guacamayaData['females']}'),

            _buildSubSectionTitle('Composición por Edad'),
            _buildDetailText('Adultos: ', '${guacamayaData['numberAdults']}'),
            _buildDetailText(
              'Juveniles: ',
              '${guacamayaData['JuvenileCount']}',
            ),

            const SizedBox(height: 24),

            // 5. Morfología
            if (morphology.isNotEmpty) ...[
              _buildSectionTitle('Morfología (en cm)'),
              _buildMorphologyTable(morphology),
            ],
          ],
        ),
      ),
    );
  }

  // --- Widgets de Ayuda ---

  // Crea el carrusel de imágenes con la vista de página deslizable
  Widget _buildImageCarousel(List<String> images, String speciesName) {
    return Container(
      height: 300, // Altura fija para el carrusel
      decoration: BoxDecoration(
        color: Colors.grey[300], // Fondo de carga
        borderRadius: BorderRadius.circular(16), // Bordes redondeados
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Carrusel (PageView)
          PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.broken_image, size: 50));
                  },
                ),
              );
            },
          ),

          // Información sobrepuesta (similar al mockup)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                // Gradiente para mejorar la legibilidad del texto
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Text(
                speciesName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear los tags (etiquetas)
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: const Color(0xFF6A1B9A), // Color morado oscuro para el tag
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  // Título principal de la sección
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Subtítulo de la sección
  Widget _buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  // Par de texto para mostrar un detalle
  Widget _buildDetailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  // Tabla para la sección de Morfología
  Widget _buildMorphologyTable(Map<String, dynamic> morphology) {
    const List<Map<String, String>> morphFields = [
      {'key': 'billLength', 'label': 'Largo del Pico'},
      {'key': 'wingChord', 'label': 'Cuerda del Ala'},
      {'key': 'tarsusLength', 'label': 'Largo del Tarso'},
      {'key': 'tailLength', 'label': 'Largo de la Cola'},
      {'key': 'totalLength', 'label': 'Largo Total'},
    ];

    return Table(
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      border: TableBorder.all(color: Colors.grey.shade300),
      children: morphFields.map((field) {
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                field['label']!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${morphology[field['key']] ?? 'N/A'} cm'),
            ),
          ],
        );
      }).toList(),
    );
  }
}

// Nota: Para probar esta clase, deberías usarla dentro de un StatelessWidget o StatefulWidget 
// y llamarla, por ejemplo:
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: GuacamayaDetailScreen(),
//     );
//   }
// }