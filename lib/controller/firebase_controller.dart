import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseController {
  BuildContext context;
  FirebaseController(this.context);

  String? getPhoneNumberFromLoginData() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.phoneNumber;
  }
  String? getEmailFromLoginData() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.email;
  }
}
