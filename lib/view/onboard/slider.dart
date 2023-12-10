class Slider {
  String image;
  String? title;
  String description;

  Slider({required this.image,  this.title, required this.description});
}
  List<Slider> contents = [
    Slider(
      image: 'assets/onboard/slider_pertama.png',
      title: 'Welcome to Komunoto',
      description:
          'Sahabat Otomotif Terbaik Anda!',
    ),
    Slider(
      image: 'assets/onboard/slider_kedua.png',
      description:
          'Terhubung dengan sesama penggemar otomotif',
    ),
    Slider(
      image: 'assets/onboard/slider_ketiga.png',
      description:
          'Temukan bengkel dan produk otomotif yang anda butuhkan!',
    ),
  ];

