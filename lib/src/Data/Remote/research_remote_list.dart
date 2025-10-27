import 'dart:convert';
import 'package:http/http.dart' as http;

class _ListRemoteProvider {
  late Future<List<dynamic>> futureList;

  _ListRemoteProvider() {
    futureList = cargarData();
  }

  final String _baseUrl =
      "https://corsproxy.io/?https://api-bird-field-logs.coderhub.run/api/external/research";
  final String _token =
      "ea4758054cbcb8691f3df48dbdce8889d5ee912bc1e4498d4a96a3917c013bbb"; // 🔒 temporal

  Future<List<dynamic>> cargarData() async {
    try {
      final url = Uri.parse(
        _baseUrl
      );
      print("🟡 Solicitando datos desde: $url");

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $_token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      print("🟢 Código de respuesta: ${response.statusCode}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        print("✅ Datos recibidos de la lista de investigaciones");

        // Algunos endpoints devuelven un array directamente
        if (decoded is List) return decoded;

        // Otros devuelven un objeto con 'data'
        if (decoded is Map && decoded.containsKey('data')) {
          return decoded['data'];
        }

        throw Exception("Estructura inesperada: $decoded");
      } else {
        print("❌ Error: ${response.body}");
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e, st) {
      print("🔥 Excepción: $e");
      print(st);
      rethrow;
    }
  }
}

final listRemoteProvider = _ListRemoteProvider();
