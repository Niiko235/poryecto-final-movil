import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Asegúrate de que tus imports sean correctos
import 'package:proyecto_final_movil/Global/Widgets/card_sampling_investigation.dart';
import 'package:proyecto_final_movil/src/Data/Local/research_local_project.dart';

// Color simulado del header
const Color primaryColor = Color(0xFF50C3AD);

// --- DATOS DE MOCKUP (para ejecutar el ejemplo si no tienes el provider real) ---
final Map<String, dynamic> _mockProjectData = {
  "name": "Estudio de Aves en Parques Urbanos",
  "description":
      "Investigación detallada sobre la ecología y comportamiento de aves en parques y zonas verdes de la ciudad. Duración de 12 meses.",
  "startDate": "2023-01-01T00:00:00.000Z",
  "endDate": "2023-12-31T00:00:00.000Z",
  "habitatType": "Bosque Urbano",
  "dominantVegetation": "Robles y Plátanos",
  "height": 2600,
  "objectives": [
    "Cuantificar la diversidad de especies.",
    "Analizar el impacto del ruido urbano.",
  ],
  "results": [
    "Aumento en la población de gorriones.",
    "Disminución de aves migratorias.",
  ],
  "locality": {"city": "Bogotá", "country": "Colombia"},
  "samplingPoints": [
    {"name": "Punto A: Norte", "status": "Completed", "muestraCount": 5},
    {"name": "Punto B: Sur", "status": "Progress", "muestraCount": 2},
  ],
};
// ----------------------------------------------------

class Investigation extends StatelessWidget {
  final String uuid;

  const Investigation({super.key, required this.uuid});

  @override
  Widget build(BuildContext context) {
    // Usaremos Future.value para el mock. Reemplaza con tu provider real.

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
            body: const Center(child: Text('Error al cargar la información.')),
          );
        }

        final Map<String, dynamic> projectData = snapshot.data!;

        // --- Extracción y Formateo de Datos ---
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

        // --- Definición de las 3 Páginas del Carrusel ---
        final List<Widget> pages = [
          _buildObjectivesResultsCard(projectData), // PÁGINA 1
          _buildDetailsSamplingCard(projectData), // PÁGINA 2
          _buildSiteDetailsCard(projectData), // PÁGINA 3
        ];

        final double screenHeight = MediaQuery.of(context).size.height;
        // Definimos la altura disponible para el PageView (ej. 250px menos la parte fija)
        final double pageViewHeight = screenHeight - 250;

        // --- SCAFFOLD con AppBar Transparente y Carrusel (PageView) ---
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarHeight: 50,
          ),
          extendBodyBehindAppBar: true,

          body: Stack(
            children: [
              // 1. HEADER CURVADO: El fondo fijo
              _buildCurvedHeader(researchName, leaderName, formattedDate),

              // 2. CARRUSEL DE CONTENIDO: PageView
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: SizedBox(
                  // Usamos un tamaño fijo (el resto de la pantalla) para el PageView dentro del Stack
                  height: pageViewHeight,
                  child: PageView.builder(
                    controller: PageController(initialPage: 1),
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      // Cada página contiene un SingleChildScrollView para desplazamiento vertical si el contenido es largo.
                      return SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 0.0,
                        ), // Padding horizontal para la tarjeta
                        child: Column(
                          children: [
                            pages[index], // La tarjeta de detalle completa
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------------
  // --- WIDGETS DE CONSTRUCCIÓN ---
  // ------------------------------------------------------------------

  // Header Curvado (sin cambios)
  Widget _buildCurvedHeader(String name, String leader, String date) {
    return Container(
      height: 280,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

  // --- PÁGINA 1: OBJETIVOS Y RESULTADOS ---
  Widget _buildObjectivesResultsCard(Map<String, dynamic> data) {
    final List<dynamic> objectives = data['objectives'] ?? [];
    final List<dynamic> results = data['results'] ?? [];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Objetivos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...objectives
                .map((obj) => _buildListItem(obj, Icons.check_circle_outline))
                .toList(),
            const SizedBox(height: 20),

            const Text(
              'Resultados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...results
                .map((res) => _buildListItem(res, Icons.star_border))
                .toList(),
          ],
        ),
      ),
    );
  }

  // --- PÁGINA 2: DETALLES Y PUNTOS DE MUESTREO ---
  Widget _buildDetailsSamplingCard(Map<String, dynamic> data) {
    final List<dynamic> samplingPoints = data['samplingPoints'] ?? [];

    return Column(
      children: [
        // Card de Detalles (Tu _buildDetailsCard original)
        _buildDetailsCard(data),
        const SizedBox(height: 20),

        // Card de Muestreos (Contiene la lista vertical)
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSamplingHeader(samplingPoints.length),
                const Divider(),
                // Lista de tus CardSamplingInvestigation
                Center(
                  child: Column(children: _listItemsJsonSimple(samplingPoints)),
                ),
                // ..._listItemsJsonSimple(samplingPoints),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- PÁGINA 3: DETALLES SOBRE EL SITIO ---
  Widget _buildSiteDetailsCard(Map<String, dynamic> data) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalles sobre el sitio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildSiteDetail(Icons.home_outlined, data['habitatType'] ?? 'N/A'),
            _buildSiteDetail(
              Icons.forest_outlined,
              data['dominantVegetation'] ?? 'N/A',
            ),
            _buildSiteDetail(
              Icons.height_outlined,
              '${data['height'] ?? 'N/A'} mts',
            ),
          ],
        ),
      ),
    );
  }

  // --- Funciones Auxiliares ---

  // Tu Card de Detalles original (extraída para PÁGINA 2)
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

  // Versión simple de tu lista de muestreos (para usar DENTRO de la Card)
  List<Widget> _listItemsJsonSimple(List<dynamic> data) {
    List<Widget> listaJson = [];

    data.forEach((items) {
      final tmpWidget = CardSamplingInvestigation(data: items);

      listaJson
        ..add(tmpWidget)
        ..add(const SizedBox(height: 10));
    });

    // Quitar el SizedBox sobrante
    if (listaJson.isNotEmpty) {
      listaJson.removeLast();
    }

    return listaJson;
  }

  // Widget auxiliar para objetivos/resultados
  Widget _buildListItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: primaryColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // Header de Muestreos para la Card interna
  Widget _buildSamplingHeader(int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Puntos de muestreo: ${count}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(height: 20),
      ],
    );
  }

  // Item de detalle para el sitio
  Widget _buildSiteDetail(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 24),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
