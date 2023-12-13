import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komunoto/controller/beranda_controller.dart';
import 'package:komunoto/custom/color.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final BerandaController berandaController = BerandaController();
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double size = MediaQuery.of(context).size.width * 0.15;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/emergency/emergency_widget.png',
          width: 62 * width / 720,
          height: 62 * height / 720,
        ),
      ),
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: width * 1,
                child: Card(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: width * 1,
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 20, 16, 20),
                              child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: SvgPicture.asset(
                                              'assets/icon_navigation/icon_profile.svg',
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.grey,
                                                      BlendMode.srcIn),
                                              height: size *
                                                  0.8, // adjust the multiplier to fit your needs
                                              width: size *
                                                  0.8, // adjust the multiplier to fit your needs
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: size, // responsive width
                                          height: size, // responsive height
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors
                                                  .primaryColor, // set border color
                                              width: 5.0, // set border width
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: CircleAvatar(
                                            radius: size / 2,
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Halo,',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Selamat Datang',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    const Icon(Icons.login)
                                  ]),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: berandaController.dataList
                                    .map<Widget>((data) {
                                  return Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data['title']!),
                                      Text(data['content']!),
                                    ],
                                  );
                                }).toList()))
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: SizedBox(
                  width: width * 1,
                  child: Card(
                      child: Row(children: [
                    const Image(
                        image: AssetImage('assets/emergency/emergency.png')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anda Dalam Keadaan Darurat?',
                          style: GoogleFonts.poppins(
                            fontSize: 22 * width / 720,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Hubungi nomor di bawah ini dan\nbantuan akan segera datang.',
                          style: GoogleFonts.poppins(
                            fontSize: 20 * width / 720,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                Text(
                                  '112',
                                  style: GoogleFonts.poppins(
                                    fontSize: 36 * width / 720,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ]))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Komunitasku',
                            style: GoogleFonts.poppins(
                                fontSize: 32 * width / 720,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Bergabung bersama komunitas',
                            style: GoogleFonts.poppins(
                                fontSize: 24 * width / 720,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.add,
                        size: 56 * width / 720,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            berandaController.listCommunity.map<Widget>((data) {
                          return SizedBox(
                            width: 100,
                            height: height * 0.2,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        data['imageUrl']!,
                                        width: 0.5 * width,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: SvgPicture.asset(
                                        data['icon']!,
                                        height: 20,
                                        width: 20,
                                      ),
                                      // replace with your icon
                                    ),
                                  ],
                                ),
                                Text(
                                  data['title']!
                                      .split(' ')
                                      .asMap()
                                      .entries
                                      .map((e) => e.key % 2 == 1
                                          ? '${e.value}\n'
                                          : e.value)
                                      .join(' '),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 24 * width / 720,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: contents.length,
                    itemBuilder: (context, i) {
                      return Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/png/slider_event.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.030,
                            top: MediaQuery.of(context).size.height * 0.10,
                            child: Text(
                              contents[i].title ?? '',
                              style: GoogleFonts.poppins(
                                fontSize: 32 *
                                    MediaQuery.of(context).size.width /
                                    720,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.030,
                            top: MediaQuery.of(context).size.height * 0.12,
                            child: Text(
                              contents[i].description ?? '',
                              style: GoogleFonts.poppins(
                                fontSize: 20 *
                                    MediaQuery.of(context).size.width /
                                    720,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 20,
                            right: 0,
                            child: Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      contents.length,
                                      (index) =>
                                          buildDot(index, context, width))),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rekomendasi Bengkel Pilihan',
                          style: GoogleFonts.poppins(
                              fontSize: 28 * width / 720,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Lihat Semua',
                          style: GoogleFonts.poppins(
                              fontSize: 20 * width / 720,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                                width: 0.4 * width,
                                height: height * 0.2,
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/png/slider_event.png',
                                            height: height * 0.1,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                         bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red),
                                            child: IntrinsicWidth(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text('A'),
                                                  Text('b'),
                                                  Text('c')
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.red),
                                      child: IntrinsicWidth(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('A'),
                                            Text('b'),
                                            Text('c')
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: 0.4 * width,
                              height: height * 0.2,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/png/slider_event.png',
                                    width: 0.5 * width,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 0.4 * width,
                              height: height * 0.2,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/png/slider_event.png',
                                    width: 0.5 * width,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context, double width) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: index == _currentPage ? 10 : 6,
      width: index == _currentPage ? 10 : 6,
      decoration: BoxDecoration(
        color: index == _currentPage ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
