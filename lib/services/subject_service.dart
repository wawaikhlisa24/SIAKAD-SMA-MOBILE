import 'package:http/http.dart' as http;
import 'dart:convert';

class SubjectService {
  static const String _baseUrl = 'https://28de-2001-448a-1187-13bb-202e-ed23-f502-1c3d.ngrok-free.app';

  static Future<List<dynamic>> fetchSubjects() async {
    final url = Uri.parse('$_baseUrl/api/subjects');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      print('Endpoint tidak ditemukan: ${response.statusCode}');
      throw Exception('Endpoint tidak ditemukan: ${response.statusCode}');
    } else {
      print('Gagal memuat subjek: ${response.statusCode}');
      print('Isi respons: ${response.body}');
      throw Exception('Gagal memuat subjek: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
