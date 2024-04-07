import 'dart:convert';
import 'package:http/http.dart' as http;
import '/global/env.dart';


//function registrasi phone
Future<http.Response> postApiRegistPhone(Map<String, dynamic> data) async {
  var response = await http.post(
    Uri.parse('$dev_url/auth/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return response;
}

//function login phone
Future<http.Response> postApiLoginPhone(Map<String, dynamic> data) async {
  var response = await http.post(
    Uri.parse('$dev_url/auth/provider'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );
  return response;
}

//function post interest
Future<http.Response> postInterest(String token, List<int> data) async {
  var response = await http.post(
    Uri.parse('$dev_url/interest'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode({'id':data}),
  );
  return response;
}

//function post update profile
Future<http.Response> postUpdateProfile(String token, Map<String, dynamic> data) async {
  
  var response = await http.put(
    Uri.parse('$dev_url/profile'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode(data),
  );
  return response;
}

Future<http.Response> postMerkMobil(String token, Map<String, dynamic> data) async {
  
  var response = await http.post(
    Uri.parse('$dev_url/merk'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode(data),
  );
  return response;
}

Future<http.Response> postType(String token, Map<String, dynamic> data) async {
  var response = await http.post(
    Uri.parse('$dev_url/vehicle/type/'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode(data),
  );
  return response;
}

Future<http.Response> postModel(String token, Map<String, dynamic> data) async {
  
  var response = await http.post(
    Uri.parse('$dev_url/vehicle/model'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode(data),
  );
  return response;
}

Future<http.Response> postVariance(String token, Map<String, dynamic> data) async {
  
  var response = await http.post(
    Uri.parse('$dev_url/vehicle/variance'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode(data),
  );
  return response;
}

Future<http.Response> postVehicle(String token, Map<String, dynamic> data) async {
  
  var response = await http.post(
    Uri.parse('$dev_url/profile/vehicle'),
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token', 'Accept': 'application/json',},
    body: jsonEncode(data),
  );
  return response;
}

