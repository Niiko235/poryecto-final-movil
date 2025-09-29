import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_sampling.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CardSampling()
        ),
      ),
    );
  }
}
