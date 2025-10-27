import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/sampling.dart';

class CardSamplingInvestigation extends StatelessWidget {
  const CardSamplingInvestigation({super.key, required this.data});

  final dynamic data;
  final styleTitle = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    String formattedDate;
    try {
      formattedDate = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(data['startDate']));
    } catch (e) {
      formattedDate = 'Fecha N/A';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sampling(data: data),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(35),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.getColor(ListColors.c0), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Punto de muestreo ${data['pointNumber'] ?? '--'}",
                    style: styleTitle,
                  ),
                  const SizedBox(height: 30),
                  _buildInfo(
                    FontAwesomeIcons.list,
                    "Tipo de muestreo",
                    data['samplingType'] ?? '--',
                  ),
                  _buildInfo(
                    FontAwesomeIcons.calendar,
                    "Fecha de inicio",
                    formattedDate,
                  ),
                  _buildInfo(
                    FontAwesomeIcons.vial,
                    "Número de muestras",
                    "${data['samples']?.length ?? '0'}",
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Ubicación",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  Text(
                    "Lat: ${data['coordinates']?['latitude'] ?? '--'}",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Lon: ${data['coordinates']?['longitude'] ?? '--'}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 25),
            Column(
              children: [
                _buildTag('${data['detection'] ?? '--'}'),
                const SizedBox(height: 200),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade700],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(40), 
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sampling(data: data),
                      ),
                    ),
                    icon: const Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.getColor(ListColors.c2)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String s) {
    final sLower = s.toLowerCase();
    Color backGroundColor;
    Color textColor;

    switch (sLower) {
      case 'red':
        backGroundColor = Colors.cyan.shade600;
        textColor = Colors.white;
        break;
      case 'visual':
        backGroundColor = Colors.red.shade600;
        textColor = Colors.white;
        break;
      default:
        backGroundColor = Colors.blue.shade700;
        textColor = Colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(
        s,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
