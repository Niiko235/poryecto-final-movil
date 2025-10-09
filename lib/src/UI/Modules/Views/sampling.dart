import 'package:flutter/material.dart';
import 'package:proyecto_final_movil/Global/Widgets/card_point_sample_sampling.dart';

class Sampling extends StatelessWidget {
  const Sampling({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: _listItemsJson(data?['samples'] ?? [], context),
        ),
      ),
    );
  }

  List<Widget> _listItemsJson(List<dynamic> data, BuildContext context) {
    List<Widget> listaJson = [];

    data.forEach((items) {
      final tmpWidget = CardPointSampleSampling(data: items);
      listaJson
        ..add(Center(child: tmpWidget))
        ..add(SizedBox(height: 10));
    });

    return listaJson;
  }
}
