import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _ProjectJsonProvider {
  late Future<List<dynamic>> futureList;

  _ProjectJsonProvider() {
    futureList = cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final datos = await rootBundle.loadString(
      'lib/src/Data/Local/projects.json',
    );
    final Map<String, dynamic> dataMap = jsonDecode(datos);
    return dataMap['data']; 
  }

  Future<Map<String, dynamic>?> getProjectByUuid(String uuid) async {
    final List<dynamic> projects = await cargarData();

    // Recorremos cada proyecto y verificamos si coincide
    for (final project in projects) {
      final research = project['data']?['research'];
      if (research != null && research['uuid'] == uuid) {
        return research; 
      }
    }

    return null; // Si no se encuentra
  }
}

final projectJsonProvider = _ProjectJsonProvider();
