import 'dart:convert';
import 'package:http/http.dart' as http;
import 'list_news_model.dart';

class ApiDatasource {
  static ApiDatasource instance = ApiDatasource();

  Future<List<Posts>> fetchData(topik) async {
    final url = Uri.parse('https://api-berita-indonesia.vercel.app/cnn/$topik');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['data'];
      final List<dynamic> results = data['posts'];
      return results.map((item) => Posts.fromJson(item)).toList();

    } else {
      throw Exception('Failed to load data');
    }
  }
}
