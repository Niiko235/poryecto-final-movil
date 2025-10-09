import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ProjectJsonProvider {
  late Future<List<dynamic>>
  futureList; // aqui nos aseguramos de que se espera a que se carguen los datos para usarlos

  _ProjectJsonProvider() {
    futureList = cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final datos = await rootBundle.loadString(
      'lib/src/Data/Local/projects.json',
    );
    Map dataMap = jsonDecode(datos);
    return dataMap['data'];
  }
}

final projectJsonProvider = _ProjectJsonProvider();
