import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:komunoto/function/function_post.dart';
import 'package:komunoto/global/env.dart';

class ProfileController {
  ValueNotifier<User?> userNotifier = ValueNotifier<User?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> getUserData() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        userNotifier.value = currentUser;
      }
    } catch (e) {
      print(e);
    }
  }

  //update first name
  Future<String> updateFirstName(String field, String firstName) async {
    try {
      Map<String, String?> token = await getToken();
      Map<String, dynamic> data = {
        field: firstName,
        // Add other fields as needed
      };

      print(data);
      http.Response response = await postUpdateProfile(token['token']!, data);

      if (response.statusCode == 200) {
        // The request was successful
        print('Success!');
        return '200';
      } else {
        // The request failed
        print('Failed with status code: ${response.statusCode}');
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  Future<String> updateLastName(String field, String lastName) async {
    try {
      Map<String, String?> token = await getToken();
      Map<String, dynamic> data = {
        field: lastName,
        // Add other fields as needed
      };
      http.Response response = await postUpdateProfile(token['token']!, data);
      if (response.statusCode == 200) {
        // The request was successful
        print('Success!');
        return '200';
      } else {
        // The request failed
        print('Failed with status code: ${response.statusCode}');
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  Future<String> updateGender(String field, String gender) async {
    try {
      Map<String, String?> token = await getToken();
      Map<String, dynamic> data = {
        field: gender,
        // Add other fields as needed
      };
      http.Response response = await postUpdateProfile(token['token']!, data);
        if (response.statusCode == 200) {
        // The request was successful
        print('Success!');
        return '200';
      } else {
        // The request failed
        print('Failed with status code: ${response.statusCode}');
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  Future<String> updateBirthPlace(
      String brithPlace, String dateOfBirth, String place, String date) async {
    try {
      Map<String, String?> token = await getToken();
      Map<String, dynamic> data = {
        brithPlace: place,
        dateOfBirth: date,
        // Add other fields as needed
      };
      print(data);
      http.Response response = await postUpdateProfile(token['token']!, data);
      if (response.statusCode == 200) {
        // The request was successful
        print('Success!');
        return '200';
      } else {
        print(response.body);
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  Future<String> updateAddress(String address, String province, String regency,
      String district, String village, String postalCode) async {
    try {
      Map<String, String?> token = await getToken();
      Map<String, dynamic> data = {
        'address': address,
        'idProvince': province,
        'idRegency': regency,
        'idDistrict': district,
        'idVillage': village,
        'postalCode': postalCode,
        // Add other fields as needed
      };
     
      http.Response response = await postUpdateProfile(token['token']!, data);
      if (response.statusCode == 200) {
        // The request was successful
        print('Success!');
        return '200';
      } else {
        // The request failed
        return 'Failed';
      }
    } catch (e) {
      print(e);
      return 'Error';
    }
  }
}
