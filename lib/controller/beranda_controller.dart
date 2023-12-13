import 'package:flutter/material.dart';

class BerandaController {
  String? image;
  String? title;
  String? description;

  BerandaController(
      { this.image, this.title,  this.description});

  final List<Map<String, String>> dataList = [
    {'title': 'Jenis Kendaraan', 'content': '-'},
    {'title': 'Nomor Plat', 'content': '-'},
    {'title': 'Terakhir Servis', 'content': '-'},
  ];

  final List<Map<String, String>> listCommunity = [
    {
      'title': 'Honda Civic Indonesia',
      'imageUrl': 'assets/png/community.png',
      'icon' : 'assets/svg/icon_verified.svg',
    },
    {
      'title': 'Toyota Indonesia',
      'imageUrl': 'assets/png/community.png',
      'icon' : 'assets/svg/icon_verified.svg',
    },
    {
      'title': 'BMW Car Indonesia',
      'imageUrl': 'assets/png/community.png',
      'icon' : 'assets/svg/icon_rekomendasi.svg',
    },  {
      'title': 'Harley Davidson Indonesia',
      'imageUrl': 'assets/png/community.png',
       'icon' : 'assets/svg/icon_rekomendasi.svg',
    },
      {
      'title': 'Dahaitsu Indonesia',
      'imageUrl': 'assets/png/community.png',
       'icon' : 'assets/svg/icon_rekomendasi.svg',
    },
    // Add more communities as needed...
  ];
}

List<BerandaController> contents = [
    BerandaController(
      image: 'assets/png/slider_event.png',
      title: 'Welcome to Komunoto',
      description:
          'Sahabat Otomotif Terbaik Anda!',
    ),
    BerandaController(
      image: 'assets/png/slider_event.png',
      description:
          'Terhubung dengan sesama penggemar otomotif',
    ),
    BerandaController(
      image: 'assets/png/slider_event.png',
      description:
          'Temukan bengkel dan produk otomotif yang anda butuhkan!',
    ),
  ];

