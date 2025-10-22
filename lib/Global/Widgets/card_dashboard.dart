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
  final styleTitle = const TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

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

    return Container(
      width: 340,
      decoration: BoxDecoration(
        gradient: AppGradients.getGradient(ListColors.linearBackground),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${formattedDate}', style: TextStyle(fontSize: 20)),
                _buildTag('Ejecución'),
              ],
            ),
          ),

          Center(
            child: Container(
              padding: EdgeInsets.all(15),
              width: 340 * 0.66,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '${data['name']}',
                textAlign: TextAlign.start,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  height: 1.2,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(FontAwesomeIcons.user, color: Colors.black, size: 20),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Dr. Juan Guzman",
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        '${data['locality']?['city'] ?? '-'}, ${data['locality']?['state'] ?? '-'}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.getColor(ListColors.c0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Investigation(uuid: data['uuid']),
                          ),
                        ),

                        print("Navegando a detalles de ${data['uuid']}"),
                      },
                      child: Center(
                        child: Text(
                          "Ver más",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTag(String s) {
    final sLower = s.toLowerCase();
    Color backGroundColor;
    Color textColor;

    switch (sLower) {
      case 'ejecución':
        backGroundColor = Colors.pink.shade100;
        textColor = Colors.pink.shade800;
        break;
      default:
        backGroundColor = Colors.blue.shade300;
        textColor = Colors.blue.shade900;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20),
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
