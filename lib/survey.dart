import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final List<String> questions = [
    'Apakah kualitas produk Servvo sudah memenuhi kebutuhan anda?',
    'Apakah pengiriman produk Servvo sudah tepat waktu?',
    'Apakah pelayanan Perusahaan kami sudah sesuai ekspektasi anda?'
  ];
  final Map<String, int> answers = {};

  @override
  void initState() {
    super.initState();
    questions.forEach((question) => answers[question] = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        backgroundColor: const Color.fromARGB(255, 206, 32, 47),
        elevation: 0,
        centerTitle: false,
        title: Text('Survey Satisfaction',
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: ListView(
                children: _buildSurveyQuestions(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildSubmitButton(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSurveyQuestions() {
    return questions.map((question) {
      return _buildQuestion(question);
    }).toList();
  }

  Widget _buildQuestion(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question,
            style: GoogleFonts.montserrat(
                fontSize: 28 * MediaQuery.of(context).size.width / 720,
                fontWeight: FontWeight.w600)),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 206, 32, 47),
              size: 20,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color.fromARGB(255, 206, 32, 47),
                  inactiveTrackColor: const Color.fromARGB(255, 206, 32, 47),
                  trackShape: const RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: const Color.fromARGB(255, 206, 32, 47),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayColor: const Color.fromARGB(255, 206, 32, 47),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                  value: answers[question]!.toDouble(),
                  min: 1.0,
                  max: 5.0,
                  divisions: 4,
                  label: answers[question].toString(),
                  onChanged: (double value) {
                    setState(() {
                      answers[question] = value.round();
                    });
                  },
                ),
              ),
            ),
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 206, 32, 47),
              size: 40,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 0.06 *
                MediaQuery.of(context)
                    .size
                    .height, // Set the height you want here
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 206, 32, 47), // This is the button color
                foregroundColor: Colors.white, // This is the color of the text
              ),
              onPressed: () {
                print(answers);
              },
              child: Text('Submit',
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 10), // Add some space between the buttons
          SizedBox(
            width: double.infinity,
            height: 0.06 *
                MediaQuery.of(context)
                    .size
                    .height, // Set the height you want here
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // This is the button color
                  foregroundColor:
                      Colors.black, // This is the color of the text
                  side: const BorderSide(color: Colors.black, width: 2)),
              onPressed: () {
                // Add your skip logic here
              },
              child: Text('Skip',
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
