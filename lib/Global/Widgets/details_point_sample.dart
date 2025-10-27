import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DetailsPointSample extends StatelessWidget {
  const DetailsPointSample({
    super.key,
    required this.date,
    required this.temperature,
    required this.luminosity,
    required this.overallConditions,
    required this.precipitation,
  });

  final dynamic date;
  final dynamic temperature;
  final dynamic luminosity;
  final dynamic overallConditions;
  final dynamic precipitation;

  @override
  Widget build(BuildContext context) {
    // Si el formato de fecha viene como string, intenta convertirlo
    String formattedDate;
    try {
      formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.parse(date));
    } catch (_) {
      formattedDate = date.toString();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🟢 Encabezado superior
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(FontAwesomeIcons.user, color: Colors.teal, size: 18),
                  const SizedBox(width: 8),
                  const Text(
                    "Juan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.temperatureFull, color: Colors.teal, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    "$temperature°C",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 📅 Fecha y condiciones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(FontAwesomeIcons.calendar, color: Colors.teal, size: 16),
                  const SizedBox(width: 8),
                  Text(formattedDate, style: const TextStyle(color: Colors.black87)),
                ],
              ),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.cloudSunRain, color: Colors.teal, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "$overallConditions",
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(thickness: 0.8, color: Color(0xFFE0E0E0)),

          // ☀️ Luminosidad
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(195, 255, 245, 1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.sun, color: Colors.teal, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "$luminosity",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 💧 Precipitación
          Row(

            children: [
              const SizedBox(width: 20),
              const Icon(FontAwesomeIcons.droplet, color: Colors.teal, size: 22),
              const SizedBox(width: 10),
              Text(
                "Precipitación: ",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text("$precipitation", style: const TextStyle(color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }
}
