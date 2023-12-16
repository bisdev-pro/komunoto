import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
}
