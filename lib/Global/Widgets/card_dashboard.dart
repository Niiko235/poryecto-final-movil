import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyecto_final_movil/Global/Colors/gradients_app.dart';
import 'package:proyecto_final_movil/Global/Enums/list_colors.dart';
import 'package:proyecto_final_movil/Global/Widgets/button_dashboard.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard({super.key});

  final styleTitle = const TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 179,
      width: 340,
      decoration: BoxDecoration(
        gradient: AppGradients.getGradient(ListColors.linearBackground),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Jan 14, 2024"), Text("Ejecucion")],
            ),
          ),

          Center(
            child: Container(
              width: 340 * 0.66,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Amazon Rainforest Biodiversity Survey",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          "Dr. Juan Guzman",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          "Amazon basin, Brazil",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ButtonDashboard()],
            ),
          ),
        ],
      ),
    );
  }
}
