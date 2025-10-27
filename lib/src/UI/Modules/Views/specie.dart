import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';

class Specie extends StatelessWidget {
  final dynamic data;
  const Specie({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    // Extracción de datos para fácil acceso
    print(
      '🟢 Página de Detalles de la Especie\nData especie mostrado correctamente',
    );
    print(data);
    final String speciesName = data['species'] ?? 'Nombre Desconocido';
    final List<String> images = List<String>.from(
      [
            'https://corsproxy.io/?https://cdn979857.fac.mil.co/sites/default/files/2018-06/guacamaya_ara_macao.jpg',
            'https://corsproxy.io/?https://fundacionjcangelcraftacparalaeducacion.wordpress.com/wp-content/uploads/2018/09/guacamaya-ara-macao.jpg',
            'https://corsproxy.io/?https://static.wikia.nocookie.net/republica-colombia/images/c/c6/Guacamaya_Bandera.jpg/revision/latest?cb=20240323185141&path-prefix=es',
          ] ??
          ['assets/images/default_image.jpg'],
    );
    final Map<String, dynamic> morphology = data['morphology'] ?? {};
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
        backgroundColor: AppColors.getColor(ListColors.action),
        // Color de fondo verde oscuro
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // Cuerpo deslizable para todo el contenido
      body: Stack(
        children: [
          // 1. Fondo Curvado
          Container(
            height: 160,
            // Altura para cubrir la Card de Ambiente
            decoration: const BoxDecoration(
              color: Color(0xFF00916E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                // Curva similar al mockup
                bottomRight: Radius.circular(40),
                // Curva similar al mockup
              ),
            ),
          ),
          // 2. Contenido Principal (Scrollable)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 36.0,
                right: 36.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Carrusel de Imágenes (PageView)
                  _buildImageCarousel(images, speciesName),
                  // Espacio entre el carrusel y los detalles
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(30.0),
                    margin: const EdgeInsets.only(bottom: 24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Nombre de la especie ---
                        Row(
                          children: [
                            const Icon(
                              Icons.eco,
                              color: Color(0xFF00916E),
                              size: 28,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                speciesName,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // --- Tags de tipo de detección y estrato ---
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 6.0,
                          children: [
                            _buildTag(
                              data['detection'] ?? '',
                              const Color(0xFF6A1B9A),
                            ),
                            _buildTag(
                              data['stratum'] ?? '',
                              const Color(0xFF00916E),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),
                        const Divider(thickness: 1, color: Color(0xFFE0E0E0)),

                        // --- Descripción del Avistamiento ---
                        _buildSectionTitle('📝 Descripción del Avistamiento'),
                        _buildDetailText(
                          'Observación: ',
                          data['observation'] ?? 'No registrada',
                        ),
                        _buildDetailText(
                          'Actividad: ',
                          data['activity'] ?? 'Sin información',
                        ),
                        _buildDetailText(
                          'Sustrato: ',
                          data['substrate'] ?? 'Sin información',
                        ),

                        const SizedBox(height: 24),
                        const Divider(thickness: 1, color: Color(0xFFE0E0E0)),

                        // --- Detalles del Censo ---
                        _buildSectionTitle('📊 Detalles del Censo'),
                        _buildDetailText(
                          'Abundancia Total: ',
                          '${data['abundance'] ?? '-'} individuos',
                        ),
                        _buildDetailText(
                          'Distancia: ',
                          '${data['distance'] ?? '-'} metros',
                        ),

                        _buildSubSectionTitle('Composición por Sexo'),
                        Row(
                          children: [
                            Expanded(
                              child: _buildStatBox(
                                'Machos',
                                '${data['males'] ?? 0}',
                                Colors.blueAccent,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildStatBox(
                                'Hembras',
                                '${data['females'] ?? 0}',
                                Colors.pinkAccent,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        _buildSubSectionTitle('Composición por Edad'),
                        Row(
                          children: [
                            Expanded(
                              child: _buildStatBox(
                                'Adultos',
                                '${data['numberAdults'] ?? 0}',
                                Colors.teal,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildStatBox(
                                'Juveniles',
                                '${data['JuvenileCount'] ?? 0}',
                                Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),
                        const Divider(thickness: 1, color: Color(0xFFE0E0E0)),

                        // --- Morfología ---
                        if (morphology.isNotEmpty) ...[
                          _buildSectionTitle('📏 Morfología (en cm)'),
                          _buildMorphologyTable(morphology),
                        ],
                        const SizedBox(height: 30),
                      ],
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

  // --- Widgets de Ayuda ---
  // Crea el carrusel de imágenes con la vista de página deslizable
  // --- Carrusel nativo con HeroLayout ---
  Widget _buildImageCarousel(List<String> images, String speciesName) {
    return Container(
      height: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child:
          // --- Carrusel moderno con animación Hero ---
          CarouselView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemExtent: 320,
            shrinkExtent: 0.8,
            itemSnapping: true,
            elevation: 5.0,

            // layout: HeroLayout(), // 💫 animación elegante nativa
            children: List.generate(images.length, (index) {
              final imageUrl = images[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            onTap: (index) {
              // Si deseas hacer algo al tocar una imagen (por ejemplo, abrir en pantalla completa)
              debugPrint("Imagen seleccionada: ${images[index]}");
            },
          ),
    );
  }

  // --- Tag con color dinámico ---
  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color.withValues(alpha: 0.9),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // --- Caja pequeña con estadística ---
  Widget _buildStatBox(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),

      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
            
        border: Border.all(color: color.withValues(alpha: 0.3), width: 2.0),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: color.withValues(alpha: 0.5),
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color.withValues(alpha: 0.9)),
          ),
        ],
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
