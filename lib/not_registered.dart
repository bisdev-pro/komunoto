import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/custom/button_next.dart';
import 'package:komunoto/custom/button_passed.dart';

class NotRegistered extends StatefulWidget {
  const NotRegistered({super.key});

  @override
  State<NotRegistered> createState() => _NotRegisteredState();
}

class _NotRegisteredState extends State<NotRegistered> {
  Set<String> selectedCars = {};
  Set<String> selectedMotorcycle = {};
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> cars = [
      'Car1',
      'Car2',
      'Car3',
      'Car4',
      'Car5',
      'Car6',
      'Car7',
      'Car8',
      'Car9',
    ]; // replace with your list of cars
    List<String> motorcycles = [
      'Motorcycle1',
      'Motorcycle2',
      'Motorcycle3'
    ]; // replace with your list of motorcycles
    bool showCars = true;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
                0.15), // adjust this value as needed
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih kendaraan \nfavorit anda',
                    style: GoogleFonts.poppins(
                      fontSize: 56 * width / 720,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Pilih kendaraan yang anda minati',
                    style: GoogleFonts.poppins(
                        fontSize: 32 * width / 720,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x7F2A2A2A)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const TabBar(
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(text: 'Cars'),
                        Tab(text: 'Motorcycles'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Replace with your Cars view
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: cars.map((car) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedCars.contains(car)) {
                                selectedCars.remove(car);
                              } else {
                                selectedCars.add(car);
                              }
                            });
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: selectedCars.contains(car)
                                      ? [
                                          Color(0xFFEE7D32),
                                          Color(0xFFFCD5A6),
                                          Color(0xFFFBC788),
                                          Color(0xFFFDDBB3),
                                          Color(0x2BF09942),
                                          Color(0xFFF4AE66),
                                          Color(0xB2EE7D32),
                                          Color(0xCCEE7D32),
                                          Color(0xE5EE7D32),
                                          Color(0xE5EE7D32),
                                          Color(0xE5EE7D32),
                                          Color(0xFFEE7D32),
                                          Color(0xFFEE7D32),
                                          Color(0xFFEE7D32),
                                          Color(0xFFEE7D32),
                                          Color(0xFFEE7D32),
                                          Color(0xFFF09741),
                                          Color(0xFFF9B461),
                                          Color(0xFFEE7D32)
                                        ]
                                      : [Colors.white, Colors.white],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(car),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: motorcycles.map((motorcycle) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedMotorcycle.contains(motorcycle)) {
                                selectedMotorcycle.remove(motorcycle);
                              } else {
                                selectedMotorcycle.add(motorcycle);
                              }
                            });
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors:
                                      selectedMotorcycle.contains(motorcycle)
                                          ? [
                                              Color(0xFFEE7D32),
                                              Color(0xFFFCD5A6),
                                              Color(0xFFFBC788),
                                              Color(0xFFFDDBB3),
                                              Color(0x2BF09942),
                                              Color(0xFFF4AE66),
                                              Color(0xB2EE7D32),
                                              Color(0xCCEE7D32),
                                              Color(0xE5EE7D32),
                                              Color(0xE5EE7D32),
                                              Color(0xE5EE7D32),
                                              Color(0xFFEE7D32),
                                              Color(0xFFEE7D32),
                                              Color(0xFFEE7D32),
                                              Color(0xFFEE7D32),
                                              Color(0xFFEE7D32),
                                              Color(0xFFF09741),
                                              Color(0xFFF9B461),
                                              Color(0xFFEE7D32)
                                            ]
                                          : [Colors.white, Colors.white],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(motorcycle),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  ButtonNext(
                    text: 'Selanjutnya',
                    onPressed: () {
                      print('Selected cars: $selectedCars');
                      print('Selected motorcycles: $selectedMotorcycle');
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonPassed(text: 'Lewati', onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
