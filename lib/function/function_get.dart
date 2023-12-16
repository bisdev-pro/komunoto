import 'dart:convert';
import 'package:http/http.dart' as http;
import '/global/env.dart';

//function get onboarding
Future<List<dynamic>> getData() async {
  final response = await http.get(Uri.parse('$dev_url/onboarding'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final List<dynamic> data = jsonResponse['data'];
    print(data);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
