import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/controller/profile_controller.dart';
import 'package:komunoto/custom/button_confirmation_phone.dart';
import 'package:komunoto/view/snack_bar/bar_error.dart';

class UpdateFirstName extends StatefulWidget {
  const UpdateFirstName({super.key});

  @override
  State<UpdateFirstName> createState() => _UpdateFirstNameState();
}

class _UpdateFirstNameState extends State<UpdateFirstName> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final ProfileController profileController = ProfileController();
  String firstName = 'firstName';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Ubah Nama Depan',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 36 * width / 720),
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Text(
                    'Pakai nama asli untuk memudahkan verifikasi. Nama\nini akan tampil di beberapa halaman.',
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontSize: 24 * width / 720),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Masukan Nama Depan Anda',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama depan tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  ButtonConfirmationPhone(
                      text: 'Simpan',
                      onPressed: () async {
                        String success =
                            await profileController.updateFirstName(
                                firstName, firstNameController.text);
                        if (success == '200') {
                          Navigator.pop(context, 'refresh');
                        } else {
                          Navigator.pop(context, 'Failed');
                        }
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
