import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLoginGoogle extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonLoginGoogle(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
        child: Container(
          width: width * 1, // 100% of screen width
          height: height * 0.06, // 6% of screen height
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFF5F5F5), 
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x7F2A2A2A)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  'assets/icon/icon_google.png',
                  width: 30,
                  height: 30,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30 * width / 720,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
