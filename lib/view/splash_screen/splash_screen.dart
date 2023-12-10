import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Set the background color to white
        body: Center(
          child: Container(
            width: 166,
            height: 64,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 146,
                  height: 44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 49,
                        top: 0,
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 3, color: Color(0xFFEE7D32)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 6,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(
                                  width: 3, color: Color(0xFFEE7D32)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 16,
                        child: Container(
                          width: 44,
                          height: 15,
                          decoration:
                              const BoxDecoration(color: Color(0xFFFAFAFA)),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 20,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Komun',
                                style: TextStyle(
                                  color: Color(0xFF2A2A2A),
                                  fontSize: 28,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.02,
                                  letterSpacing: -0.50,
                                ),
                              ),
                              TextSpan(
                                text: 'oto',
                                style: TextStyle(
                                  color: Color(0xFFEE7D32),
                                  fontSize: 28,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.02,
                                  letterSpacing: -0.50,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
