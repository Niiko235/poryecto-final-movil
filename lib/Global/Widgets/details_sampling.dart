import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DetailsSampling extends StatelessWidget {
  const DetailsSampling({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    
    String startDate, endDate;
    try {
      startDate = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(data['startDate']));
      endDate = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(data['endDate']));
    } catch (e) {
      startDate = 'Fecha N/A';
      endDate = 'Fecha N/A';
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟣 ENCABEZADO
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 15,
            ),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Punto de muestreo ${data['pointNumber'] ?? '--'}",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 📍 INFORMACIÓN PRINCIPAL
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(195, 255, 245, 1),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            FontAwesomeIcons.locationDot,
                            color: Colors.teal,
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Ubicación",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Lat: ${data['coordinates']?['latitude'] ?? '--'}",
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                Text(
                                  "Lon: ${data['coordinates']?['longitude'] ?? '--'}",
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                startDate,
                                style: const TextStyle(color: Colors.black87),
                              ),
                              Text(
                                endDate,
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // const Divider(),

                      // Tipo de muestra
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.vial,
                            color: Colors.teal,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Tipo: ",
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text("${data['samplingType'] ?? '--'}"),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Detalles
                      const Text(
                        "Detalles de la muestra",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${data['detailSamplingType'] ?? 'No hay más detalles de la muestra.'}",
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                // Ubicación
                const SizedBox(height: 25),
                // const Divider(),
                const SizedBox(height: 10),
                // Métricas visuales (detección / periodo)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMetric(
                      icon: FontAwesomeIcons.eye,
                      title: "${data['detection'] ?? '--'}",
                      subtitle: "Detección",
                    ),
                    _buildMetric(
                      icon: FontAwesomeIcons.clock,
                      title: "${data['censusPeriod'] ?? '--'} días",
                      subtitle: "Periodo",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ],
    );
  }
}
