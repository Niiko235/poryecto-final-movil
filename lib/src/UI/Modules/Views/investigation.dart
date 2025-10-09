import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_sampling_investigation.dart';
import 'package:proyecto_final_movil/src/Data/Local/research_local_project.dart';
// Asegúrate de que tus imports sean correctos
// import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
// import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
// import 'package:proyecto_final_movil/Global/Widgets/card_sampling_investigation.dart';
// import 'package:proyecto_final_movil/src/Data/Local/research_local_project.dart';

// Color simulado del header
const Color primaryColor = Color(0xFF50C3AD);

class Investigation extends StatelessWidget {
  final String uuid;

  const Investigation({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: projectJsonProvider.getProjectByUuid(uuid),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(
              child: Text('Error al cargar la información del proyecto.'),
            ),
          );
        }

        final Map<String, dynamic> projectData = snapshot.data!;

        // --- Extracción de datos ---
        final String researchName =
            projectData['name'] ?? 'Proyecto Sin Nombre';
        const String leaderName = 'Dr. Juan Guzman';

        String formattedDate;
        try {
          formattedDate = DateFormat(
            'MMM dd, yyyy',
          ).format(DateTime.parse(projectData['startDate']));
        } catch (e) {
          formattedDate = 'Fecha N/A';
        }

        final List<dynamic> samplingPoints =
            projectData['samplingPoints'] ?? [];

        // --- SCAFFOLD con AppBar Transparente para Navegación ---
        return Scaffold(
          // 1. APPBAR: Transparente, sin sombra, y con iconos blancos.
          //    Esto da la flecha de navegación de vuelta GRATIS.
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ), // Hace la flecha blanca
            toolbarHeight: 50, // Ajusta la altura de la AppBar
          ),

          // El 'extendBodyBehindAppBar: true' es crucial para que el Stack
          // se extienda por debajo de la AppBar.
          extendBodyBehindAppBar: true,

          body: Stack(
            children: [
              // 2. HEADER CURVADO: Ahora solo el fondo y la info, sin el botón de atrás.
              _buildCurvedHeader(researchName, leaderName, formattedDate),

              // 3. Contenido Deslizable (Detalles y Lista de Muestreos)
              Padding(
                // Reduce el padding superior ya que la AppBar (50px) + el texto
                // del header ya ocupan espacio.
                padding: const EdgeInsets.only(top: 220),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Card de Detalles
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: _buildDetailsCard(projectData),
                      ),

                      const SizedBox(height: 20),

                      // Título de la Sección de Muestreos
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 46.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Muestreos (${samplingPoints.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Lista de Puntos de Muestreo
                      ..._listItemsJson(samplingPoints, context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- WIDGETS DE CONSTRUCCIÓN SIMPLIFICADOS ---

  // Header Curvado (SIMPLIFICADO: sin el IconButton)
  Widget _buildCurvedHeader(String name, String leader, String date) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      // Ajusta el padding superior para evitar que el texto se esconda bajo la AppBar
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ¡Icono de navegación eliminado! La AppBar lo maneja.
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.white, size: 18),
              const SizedBox(width: 5),
              Text(
                leader,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.calendar_today, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text(
                date,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Card de Detalles (sin cambios)
  Widget _buildDetailsCard(Map<String, dynamic> data) {
    final String description =
        data['description'] ?? 'Descripción no disponible.';
    final String locality = data['locality'] != null
        ? '${data['locality']['city']}, ${data['locality']['country']}'
        : 'Ubicación no especificada';

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalles',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Ubicación: $locality',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Función para listar los ítems de muestreo (mantiene la estructura original)
  List<Widget> _listItemsJson(List<dynamic> data, BuildContext context) {
    List<Widget> listaJson = [];

    // Placeholder para CardSamplingInvestigation
    data.forEach((items) {
      final tmpWidget = CardSamplingInvestigation(data: items);

      listaJson
        ..add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: tmpWidget,
          ),
        )
        ..add(const SizedBox(height: 10));
    });

    return listaJson;
  }
}

// --- MOCKUP DE DATOS (Para que el código sea ejecutable) ---
Map<String, dynamic> _getDummyProjectData() {
  return {
    "name": "Estudio de biodiversidad urbana",
    "description":
        "Investigación sobre aves en parques y zonas verdes de la ciudad para evaluar el impacto de la urbanización en la fauna local.",
    "startDate": "2023-01-01T00:00:00.000Z",
    "locality": {"city": "Bogotá", "country": "Colombia"},
    "samplingPoints": [
      {
        "name": "Punto de captura A",
        "status": "Progress",
        "muestraCount": 3,
        "date": "2024-08-31T00:00:00.000Z",
      },
      {
        "name": "Punto de transecto B",
        "status": "Completed",
        "muestraCount": 1,
        "date": "2024-08-31T00:00:00.000Z",
      },
    ],
  };
}
