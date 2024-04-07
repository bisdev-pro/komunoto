import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarError {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
