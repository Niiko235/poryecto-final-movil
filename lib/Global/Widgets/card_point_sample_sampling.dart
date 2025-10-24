import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final_movil/Global/Colors/colors_app.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/src/UI/Modules/Views/samplig_point.dart';

class CardPointSampleSampling extends StatelessWidget {
  final dynamic data;
  const CardPointSampleSampling({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    String formattedDate;
    try {
      formattedDate = DateFormat(
        'MMM dd, yyyy',
      ).format(DateTime.parse(data['date']));
    } catch (e) {
      formattedDate = 'Fecha N/A';
    }

    final int speciesCount = data['observedSpecies']?.length ?? 0;
    // final String condition = data['overallConditions'] ?? 'N/A';
    // final Color conditionColor = _getConditionColor(condition);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SampligPoint(data: data)),
        );
      },
      child: Container(
        width: 340,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: AppGradients.getGradient(ListColors.linearBackground),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con fecha y chip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                buildConditionChip(data['overallConditions'] ?? 'Desconocido'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.dove,
                  size: 30,
                  color: Colors.black87,
                ),
                const SizedBox(width: 10),
                Text(
                  '$speciesCount especies observadas',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SampligPoint(data: data),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.getColor(ListColors.c0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Ver más detalles",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildConditionChip(String condition) {
    Color textColor;

    switch (condition.toLowerCase()) {
      case 'bueno':
        textColor = Colors.green.shade700;
        break;
      case 'normal':
        textColor = Colors.orange.shade700;
        break;
      case 'malo':
        textColor = Colors.red.shade700;
        break;
      default:
        textColor = Colors.blueGrey.shade700;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(195, 255, 245, 1), // tu color de contraste
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        condition,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
