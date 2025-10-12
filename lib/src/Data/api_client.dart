import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl =
      "https://api-bird-field-logs.coderhub.run/api/external";

  final String _token =
      "ea4758054cbcb8691f3df48dbdce8889d5ee912bc1e4498d4a96a3917c013bbb";

  Map<String, String> get _headers => {
    'Authorization': 'Bearer $_token',
    'Content-Type': 'application/json',
  };

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    print('GET $url');

    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      print("✅ Conexión exitosa");
      return jsonDecode(response.body);
    } else {
      print("❌ Error ${response.statusCode}: ${response.body}");
      throw Exception("Error ${response.statusCode}");
    }
  }
}
