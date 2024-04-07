import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateKendaraan extends StatefulWidget {
  final String id;
  const UpdateKendaraan({super.key, required this.id});

  @override
  State<UpdateKendaraan> createState() => _UpdateKendaraanState();
}

class _UpdateKendaraanState extends State<UpdateKendaraan> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        title: Text('Detail Kendaraan', style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 36 * width / 720,
        ),), 
      ),
      body: SingleChildScrollView(
        child: Text(widget.id),
      ),
    );
  }
}