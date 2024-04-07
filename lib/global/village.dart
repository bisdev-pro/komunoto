import 'dart:convert';
import 'package:http/http.dart' as http;
import '/global/env.dart';

Future<List<dynamic>> getVillages(String id) async {
  final response = await http.get(Uri.parse('$dev_url/village/$id'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final List<dynamic> data = jsonResponse['data'];
    print(data);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}