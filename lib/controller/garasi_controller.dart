import 'dart:ffi';

import 'package:komunoto/function/function_get.dart';
import 'package:komunoto/function/function_post.dart';
import 'package:komunoto/global/env.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GarasiController {
  String? token;

  Future<List<Map<String, dynamic>>> fetchVehicles() async {
    try {
      Map<String, String?> token = await getToken();
      List<Map<String, dynamic>> vehicles =
          await getDataVehicle(token['token']!);
    
      return vehicles;
    } catch (e) {
      print('Failed to fetch vehicles: $e');
      return [];
    }
  }

  Future<List<dynamic>> getMerkMobil(String id) async {
    Map<String, String?> token = await getToken();
    Map<String, dynamic> data = {
      'idVehicle': id,
      // Add other fields as needed
    };

   http.Response response = await postMerkMobil(token['token']!, data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> getType(String id) async {
    Map<String, String?> token = await getToken();
    Map<String, dynamic> data = {
      'idVehicle': id,
      // Add other fields as needed
    };

   http.Response response = await postType(token['token']!, data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> getModel(String idType, String idMerk) async {
    Map<String, String?> token = await getToken();
    Map<String, dynamic> data = {
      'idVehicleType': idType,
      'idVehicleMerk': idMerk,
      // Add other fields as needed
    };

   http.Response response = await postModel(token['token']!, data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> getVariance(String id) async {
    Map<String, String?> token = await getToken();
    Map<String, dynamic> data = {
      'idVehicleModel': id,
      // Add other fields as needed
    };

   http.Response response = await postVariance(token['token']!, data);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> data = jsonResponse['data'];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> storeVehicle(dynamic jenisKendaraaan, dynamic typeKendaraan, dynamic merkKendaran,  dynamic modelKendaraan, dynamic varianKendaraan, String tahunKendaraan, String nomorPolisi, String tanggalPajak, dynamic transmission, String namaKendaraan ) async {
    Map<String, String?> token = await getToken();
    Map<String, dynamic> data = {
      'name': namaKendaraan,
      'idVehicle': jenisKendaraaan,
      'idVehicleType': typeKendaraan,
      'idVehicleMerk': merkKendaran,
      'idVehicleModel': modelKendaraan,
      'idVehicleVariance': varianKendaraan,
      'idVehicleTransmission' : transmission,
      'isDefault': true,
      'stnkValidityPeriod': tanggalPajak,
      'platNumber': nomorPolisi,     
      'image' : null,
      'status' : true 
      // Add other fields as needed
    };

  
   http.Response response = await postVehicle(token['token']!, data);
   
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final Map<String, dynamic> data = jsonResponse['data'];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
