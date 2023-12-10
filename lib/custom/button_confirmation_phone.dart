import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonConfirmationPhone extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonConfirmationPhone(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width * 1, // 80% of screen width
        height: height * 0.06, // 6% of screen height
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFFEE7D32),
              Color(0xFFFCD5A6),
              Color(0xFFFBC788),
              Color(0xFFFDDBB3),
              Color(0x2BF09942),
              Color(0xFFF4AE66),
              Color(0xB2EE7D32),
              Color(0xCCEE7D32),
              Color(0xE5EE7D32),
              Color(0xE5EE7D32),
              Color(0xE5EE7D32),
              Color(0xFFEE7D32),
              Color(0xFFEE7D32),
              Color(0xFFEE7D32),
              Color(0xFFEE7D32),
              Color(0xFFEE7D32),
              Color(0xFFF09741),
              Color(0xFFF9B461),
              Color(0xFFEE7D32)

              // ... other colors
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
