import 'dart:convert';
import 'package:http/http.dart' as http;
import '/global/env.dart';

Future<List<dynamic>> getProvince() async {
  final response = await http.get(Uri.parse('$dev_url/province'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final List<dynamic> data = jsonResponse['data'];
    print(data);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}