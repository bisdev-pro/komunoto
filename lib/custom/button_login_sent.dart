import 'package:flutter/material.dart';

class ButtonLoginSent extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  const ButtonLoginSent(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color(0xB3EE7D32),
                  Color(0xCCEE7D32),
                  Color(0xE6EE7D32),
                  Color(0xE6EE7D32),
                  Color(0xE6EE7D32),
                  Color(0xFFEE7D32),
                  Color(0xFFEE7D32),
                  Color(0xFFEE7D32),
                  Color(0xFFEE7D32),
                  Color(0xFFEE7D32),
                  Color(0xFFEE7D32),
                ], // specify your colors here
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white), // specify your text color here
              ),
            ),
          ),
        ));
  }
}
