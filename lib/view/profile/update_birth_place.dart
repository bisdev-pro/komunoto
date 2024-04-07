import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/controller/profile_controller.dart';
import 'package:komunoto/custom/button_confirmation_phone.dart';
import 'package:intl/intl.dart';
import 'package:komunoto/view/snack_bar/bar_error.dart';

class UpdateBirthPlace extends StatefulWidget {
  const UpdateBirthPlace({super.key});

  @override
  State<UpdateBirthPlace> createState() => _UpdateBirthPlaceState();
}

class _UpdateBirthPlaceState extends State<UpdateBirthPlace> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final placeController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final ProfileController profileController = ProfileController();
  String brithPlace = 'brithPlace';
  String dateOfBirth = 'dateOfBirth';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Ubah Tempat Tanggal Lahir',
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 36 * width / 720),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masukan tempat dan tanggal lahir anda.',
                style: GoogleFonts.poppins(
                    color: Colors.grey, fontSize: 24 * width / 720),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: TextFormField(
                  controller: placeController,
                  decoration: InputDecoration(
                    labelText: 'Masukan Tempat Lahir Anda',
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      dateOfBirthController.text =
                          DateFormat('yyyy-MM-dd').format(date);
                    }
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      controller: dateOfBirthController,
                      decoration: InputDecoration(
                        labelText: 'Masukan Tanggal Lahir Anda',
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
                          return 'Tanggal lahir tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              ButtonConfirmationPhone(
                  text: 'Simpan',
                  onPressed: () async {
                  String success =  await profileController.updateBirthPlace(
                        brithPlace,
                        dateOfBirth,
                        placeController.text,
                        dateOfBirthController.text);
                        print(success);
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
    );
  }
}
