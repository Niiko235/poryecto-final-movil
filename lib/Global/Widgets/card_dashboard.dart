import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/investigation.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard({super.key, required this.data});

  final dynamic data;

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
            builder: (context) => Investigation(uuid: data['uuid']),
          ),
        );
      },
      child: Container(
        width: 340,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          gradient: AppGradients.getGradient(ListColors.linearBackground),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📅 Fecha y estado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  _buildTag('Ejecución'),
                ],
              ),

              const SizedBox(height: 20),

              // 📘 Título del proyecto
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${data['name']}',
                  textAlign: TextAlign.start,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 👤 Responsable
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.solidUser,
                    color: AppColors.getColor(ListColors.darkText),
                    size: 20,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Responsable",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text("Dr. Juan Guzman", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 📍 Localidad
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.locationDot,
                    color: AppColors.getColor(ListColors.darkText),
                    size: 20,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Localidad",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${data['locality']?['city'] ?? '-'}, ${data['locality']?['state'] ?? '-'}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔘 Botón Ver más
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Investigation(uuid: data['uuid']),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  label: const Text(
                    "Ver más",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String s) {
    final sLower = s.toLowerCase();
    Color backgroundColor;
    Color textColor;

    switch (sLower) {
      case 'pendiente':
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case 'finalizado':
        backgroundColor = Colors.blue.shade100;
        textColor = Colors.blue.shade800;
        break;
      case 'ejecución':
        backgroundColor = Colors.pink.shade600;
        textColor = Colors.white;
        break;
      default:
        backgroundColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(s, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}
