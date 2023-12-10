import 'package:flutter/material.dart';

class BerandaController {
  final List<Map<String, String>> dataList = [
    {'title': 'Jenis Kendaraan', 'content': '-'},
    {'title': 'Nomor Plat', 'content': '-'},
    {'title': 'Terakhir Servis', 'content': '-'},
  ];

  final List<Map<String, String>> listCommunity = [
    {
      'title': 'Honda Civic Indonesia',
      'imageUrl': 'assets/onboard/slider_pertama.png',
      'icon' : 'assets/svg/icon_verified.svg',
    },
    {
      'title': 'Toyota Indonesia',
      'imageUrl': 'assets/onboard/slider_pertama.png',
      'icon' : 'assets/svg/icon_verified.svg',
    },
    {
      'title': 'BMW Car Indonesia',
      'imageUrl': 'assets/onboard/slider_pertama.png',
      'icon' : 'assets/svg/icon_rekomendasi.svg',
    },  {
      'title': 'Harley Davidson Indonesia',
      'imageUrl': 'assets/onboard/slider_pertama.png',
       'icon' : 'assets/svg/icon_rekomendasi.svg',
    },
      {
      'title': 'Dahaitsu Indonesia',
      'imageUrl': 'assets/onboard/slider_pertama.png',
       'icon' : 'assets/svg/icon_rekomendasi.svg',
    },
    // Add more communities as needed...
  ];
}
