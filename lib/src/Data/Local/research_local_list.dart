import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ListJsonProvider {
  late Future<List<dynamic>>
  futureList; // aqui nos aseguramos de que se espera a que se carguen los datos para usarlos

  _ListJsonProvider() {
    futureList = cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final datos = await rootBundle.loadString(
      'lib/src/Data/Local/list_projects.json',
    );
    Map dataMap = jsonDecode(datos);
    return dataMap['data'];
  }
}

final listJsonProvider = _ListJsonProvider();
