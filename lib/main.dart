import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_specie_point.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_point_sample_sampling.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_sampling_investigation.dart';
import 'package:proyecto_final_movil/Global/Widgets/details_point_sample.dart';
import 'package:proyecto_final_movil/Global/Widgets/details_sampling.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: CardSpeciePoint())),
    );
  }
}
