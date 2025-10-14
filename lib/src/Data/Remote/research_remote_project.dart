import 'dart:convert';
import 'package:http/http.dart' as http;

class _RemoteListJsonProvider {
  late Future<List<dynamic>> futureList;

  _RemoteListJsonProvider() {
    futureList = cargarData();
  }

  final String _baseUrl =
      "https://corsproxy.io/?https://api-bird-field-logs.coderhub.run/api/external";
  final String _token =
      "ea4758054cbcb8691f3df48dbdce8889d5ee912bc1e4498d4a96a3917c013bbb"; // 🔒 temporal

  Future<List<dynamic>> cargarData() async {
    final url = Uri.parse("$_baseUrl/details/research");

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> dataMap = await jsonDecode(response.body);
      return dataMap['data'];
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }

  Future<Map<String, dynamic>?> getProjectByUuid(String uuid) async {
    final url = Uri.parse(
      'https://corsproxy.io/?https://api-bird-field-logs.coderhub.run/api/external/details/research/$uuid',
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
      final Map<String, dynamic> dataMap = jsonDecode(response.body);
      print("✅ Datos recibidos: ${dataMap}");
      return dataMap['data']['research'];
    } else {
      throw Exception('Error ${response.statusCode}: ${response.body}');
    }
  }
}

final projectRemoteProvider = _RemoteListJsonProvider();
