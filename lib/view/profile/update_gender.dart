import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/controller/profile_controller.dart';
import 'package:komunoto/custom/button_confirmation_phone.dart';
import 'package:komunoto/view/snack_bar/bar_error.dart';

class UpdateGender extends StatefulWidget {
  const UpdateGender({super.key});

  @override
  State<UpdateGender> createState() => _UpdateGenderState();
}

class _UpdateGenderState extends State<UpdateGender> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final ProfileController profileController = ProfileController();
  List<String> genders = [
    'Laki Laki',
    'Perempuan',
    'Lainnya'
  ]; 
  String? selectedGender;
  String gender = 'gender';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Ubah Jenis Kelamin',
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Jenis Kelamin Anda',
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
                  value: selectedGender,
                  items: genders.map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis kelamin tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              ButtonConfirmationPhone(
                  text: 'Simpan',
                  onPressed: () async {
                   String success =  await profileController.updateGender(gender,
                        selectedGender!);
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
