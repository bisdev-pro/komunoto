import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiURL = 'http://178.16.138.109:4000';

//function registrasi phone
Future<http.Response> postApiRegistPhone(Map<String, dynamic> data) async {
  var response = await http.post(
    Uri.parse('$apiURL/auth/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return response;
}

//function login phone
Future<http.Response> postApiLoginPhone(Map<String, dynamic> data) async {
  print(data);
  var response = await http.post(
    Uri.parse('$apiURL/auth/provider'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return response;
}
