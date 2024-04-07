import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/controller/garasi_controller.dart';
import 'package:komunoto/custom/color.dart';
import 'package:komunoto/view/garasi/form_kendaraan.dart';
import 'package:komunoto/view/garasi/update_kendaraan.dart';

class ViewGarasi extends StatefulWidget {
  const ViewGarasi({super.key});

  @override
  State<ViewGarasi> createState() => _ViewGarasiState();
}

class _ViewGarasiState extends State<ViewGarasi> {
  GarasiController controller = GarasiController();
  List<Map<String, dynamic>> vehicles = [];

  @override
  void initState() {
    super.initState();
    fetchVehicles();
  }

  fetchVehicles() async {
    vehicles = await controller.fetchVehicles();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Garasi',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 36 * width / 720,
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormKendaraan()));
                },
                child: Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: 60 * width / 720,
                )),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: width * 1,
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage('assets/png/slider_event.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateKendaraan(
                                          id: vehicles[index]['id'] )));
                                },
                                child: Icon(
                                  Icons.settings,
                                  color: AppColors.primaryColor,
                                ))),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.car_rental_outlined),
                                Text('Jenis Kendaraan'),
                                Text(vehicles[index]['name'])
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.perm_contact_calendar_outlined),
                                Text('Nomor Plat'),
                                Text(vehicles[index]['platNumber'])
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.document_scanner_outlined),
                                Text('STNK Aktif'),
                                Text(vehicles[index]['stnkValidityPeriod'])
                              ],
                            )
                          ]),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
