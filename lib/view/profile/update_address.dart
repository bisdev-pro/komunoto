import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/controller/profile_controller.dart';
import 'package:komunoto/custom/button_confirmation_phone.dart';
import 'package:komunoto/global/district.dart';
import 'package:komunoto/global/province.dart';
import 'package:komunoto/global/regency.dart';
import 'package:komunoto/global/village.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final ProfileController profileController = ProfileController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  List<dynamic> provinces = [];
  List<dynamic> regencies = [];
  List<dynamic> district = [];
  List<dynamic> village = [];
  String? selectedProvince;
  String? selectedRegency;
  String? selectedDistrict;
  String? selectedVillage;

  @override
  void initState() {
    super.initState();
    fetchProvinces();
  }

  void fetchProvinces() async {
    final data = await getProvince();
    setState(() {
      provinces = data;
    });
  }

  void fetchRegencies(String provinceId) async {
    final data = await getRegency(provinceId);
    setState(() {
      regencies = data;
    });
  }

  void fetchDistricts(String regencyId) async {
    final data = await getDistrics(regencyId);
    setState(() {
      district = data;
    });
  }

  void fetchVillages(String districtId) async {
    final data = await getVillages(districtId);
    setState(() {
      village = data;
    });
  }

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
                    'Pakai alamat asli anda untuk memudahkan verifikasi.\nAlamat ini akan tampil di beberapa halaman.',
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontSize: 24 * width / 720),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: 'Masukan Alamat Anda',
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
                      minLines:
                          3, // this will make the TextFormField a text area
                      maxLines:
                          null, // this will allow the TextFormField to expand as the user types more lines
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Pilih Provinsi Anda',
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
                      items: provinces.map((province) {
                        return DropdownMenuItem(
                          value: province['id'].toString(),
                          child: Text(province['name']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedProvince = value;
                          fetchRegencies(value!);
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Provinsi tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Pilih Kota / Kabupaten Anda',
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
                      items: regencies.map((regency) {
                        return DropdownMenuItem(
                          value: regency['id'].toString(),
                          child: Text(regency['name']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRegency = value;
                          fetchDistricts(value!);
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kota / Kabupaten tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Pilih Kecamatan Anda',
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
                      items: district.map((district) {
                        return DropdownMenuItem(
                          value: district['id'].toString(),
                          child: Text(district['name']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value;
                          fetchVillages(value!);
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kecamatan tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Pilih Kelurahan / Desa Anda',
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
                      items: village.map((village) {
                        return DropdownMenuItem(
                          value: village['id'].toString(),
                          child: Text(village['name']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedVillage = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kelurahan / Desa tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: TextFormField(
                      controller: postalCodeController,
                      decoration: InputDecoration(
                        labelText: 'Masukan Kode Pos Anda',
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
                          return 'Kode pos tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  ButtonConfirmationPhone(
                      text: 'Simpan',
                      onPressed: () async {
                        String success = await profileController.updateAddress(
                            addressController.text,
                            selectedProvince!,
                            selectedRegency!,
                            selectedDistrict!,
                            selectedVillage!,
                            postalCodeController.text);
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
