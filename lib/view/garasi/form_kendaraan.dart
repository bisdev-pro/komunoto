import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:komunoto/controller/beranda_controller.dart';
import 'package:komunoto/controller/garasi_controller.dart';
import 'package:komunoto/custom/button_next.dart';
import 'package:komunoto/custom/button_save.dart';

class FormKendaraan extends StatefulWidget {
  const FormKendaraan({super.key});

  @override
  State<FormKendaraan> createState() => _FormKendaraanState();
}

class _FormKendaraanState extends State<FormKendaraan> {
  final BerandaController berandaController = BerandaController();
  final garasiController = GarasiController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  TextEditingController tahunKendaraan = TextEditingController();
  TextEditingController nomorPolisi = TextEditingController();
  TextEditingController tanggalPajak = TextEditingController();
  TextEditingController namaKendaraan = TextEditingController();
  

  int? dropdownValue;
  Map<String, dynamic>? userData;
  List<dynamic> merkList = [];
  List<dynamic> typeList = [];
  List<dynamic> modelList = [];
  List<dynamic> varianList = [];
  String itemSelected = '';
  String merkSelected = '';
  String typeSelected = '';
  String modelSelected = '';
  String varianSelected = '';
  String transmission = '';

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchMerk(String id) async {
    final data = await garasiController.getMerkMobil(id);
    final simplifiedData = data
        .map((item) => {
              'id': item['id'],
              'name': item['name'],
            })
        .toList();
    setState(() {
      merkList = simplifiedData;
    });
  }

  void fetchType(String id) async {
    final data = await garasiController.getType(id);
    final simplifiedData = data
        .map((item) => {
              'id': item['id'],
              'name': item['name'],
            })
        .toList();
    setState(() {
      typeList = simplifiedData;
    });
  }

  void fetchModel(String typeSelected, String merkSelected) async {
    final data = await garasiController.getModel(typeSelected, merkSelected);
    final simplifiedData = data
        .map((item) => {
              'id': item['id'],
              'name': item['name'],
            })
        .toList();
    setState(() {
      modelList = simplifiedData;
    });
  }

  void fetchVarian(String modelSelected) async {
    final data = await garasiController.getVariance(modelSelected);
    final simplifiedData = data
        .map((item) => {
              'id': item['id'],
              'name': item['name'],
              'transmission': item['idVehicleTransmission'],
            })
        .toList();
    setState(() {
      varianList = simplifiedData;
    });
  }

  Future<void> fetchData() async {
    userData = await berandaController.fetchUserData();
    nameController.text = userData?['firstName'] ?? '';
    phoneController.text = userData?['phoneNumber'] ?? '';
    emailController.text = userData?['email'] ?? 'Tidak Terdaftar';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Masukan Kendaraan',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 12 / width * 720,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: const Color(0xB32B2B2B),
                          size: 30 * width / 360,
                        ),
                        Text(
                          'Isi data agar produk & layanan yang\nditampilkan sesuai kebutuhan mobilmu',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 24 * width / 720,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Field Name
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      enabled: false,
                      controller: nameController,
                      decoration: InputDecoration(
                        // labelText: 'Nama Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 12 / width * 720,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Field Phone Number
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor HP',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      enabled: false,
                      controller: phoneController,
                      decoration: InputDecoration(
                        // labelText: 'Nama Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 12 / width * 720,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Field Email
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      enabled: false,
                      controller: emailController,
                      decoration: InputDecoration(
                        // labelText: 'Nama Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 12 / width * 720,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Field Nama Kendaraan
                Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Nama Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 28 * width / 720),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: namaKendaraan, // controller for the text field
                    ),
                  ],
                ),
              ),
              // Field Jenis Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          isExpanded: true,
                          hint: Text('Pilih Jenis Kendaraan',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 28 * width / 720,
                              )),
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (int? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              fetchMerk(dropdownValue.toString());
                              // fetchType(dropdownValue.toString());
                            });
                          },
                          items: <DropdownMenuItem<int>>[
                            DropdownMenuItem(
                              value: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Mobil',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28 * width / 720,
                                    )),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text('Motor',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28 * width / 720,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Field Merk Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Merk Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropdownSearch<Map<String, dynamic>>(
                      items: merkList.cast<Map<String, dynamic>>(),
                      itemAsString: (item) => item['name'],
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                      ),
                      dropdownButtonProps: DropdownButtonProps(
                        color: Colors.blue,
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        textAlignVertical: TextAlignVertical.center,
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onChanged: (value) {
                        setState(() {
                          merkSelected = value!['id'];

                          fetchType(dropdownValue.toString());
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Field Tipe Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tipe Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropdownSearch<Map<String, dynamic>>(
                      items: typeList.cast<Map<String, dynamic>>(),
                      itemAsString: (item) => item['name'],
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                      ),
                      dropdownButtonProps: DropdownButtonProps(
                        color: Colors.blue,
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        textAlignVertical: TextAlignVertical.center,
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onChanged: (value) {
                        setState(() {
                          typeSelected = value!['id'];
                          fetchModel(typeSelected, merkSelected);
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Field Model Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropdownSearch<Map<String, dynamic>>(
                      items: modelList.cast<Map<String, dynamic>>(),
                      itemAsString: (item) => item['name'],
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                      ),
                      dropdownButtonProps: DropdownButtonProps(
                        color: Colors.blue,
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        textAlignVertical: TextAlignVertical.center,
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onChanged: (value) {
                        setState(() {
                          modelSelected = value!['id'];
                          fetchVarian(modelSelected);
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Field Varian Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Varian Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropdownSearch<Map<String, dynamic>>(
                      items: varianList.cast<Map<String, dynamic>>(),
                      itemAsString: (item) => item['name'],
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                      ),
                      dropdownButtonProps: DropdownButtonProps(
                        color: Colors.blue,
                      ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        textAlignVertical: TextAlignVertical.center,
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onChanged: (value) {
                        setState(() {
                          varianSelected = value!['id'];
                          transmission = value['transmission'];
                         
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Field Tahun Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tahun Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Tahun Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 28 * width / 720),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller:
                          tahunKendaraan, // controller for the text field
                    ),
                  ],
                ),
              ),
              // Field Nomor Polisi Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Polisi Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Nomor Polisi Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 28 * width / 720),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: nomorPolisi, // controller for the text field
                    ),
                  ],
                ),
              ),
              // Field Masa Berakhir Pajak Kendaraan
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masa Berakhir Pajak Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10 / width * 720,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Masukan Masa Berakhir Pajak Kendaraan',
                        labelStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 28 * width / 720),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(
                            FocusNode()); // to prevent opening default keyboard
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1945),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          // format the picked date and set it to the text field
                          // you can use any date format you want
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(picked);
                          // use a text editing controller to update the text field
                          tanggalPajak.text = formattedDate;
                        }
                      },
                      controller: tanggalPajak, // controller for the text field
                    ),
                  ],
                ),
              ),
              // Save Button
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                child: ButtonSave(text: 'Simpan', onPressed: () async {
                  await garasiController.storeVehicle(dropdownValue.toString(), typeSelected, merkSelected, modelSelected, varianSelected, tahunKendaraan.text, nomorPolisi.text, tanggalPajak.text, transmission, namaKendaraan.text);
                  
                }),
              ),
            ],
          ),
        )));
  }
}
