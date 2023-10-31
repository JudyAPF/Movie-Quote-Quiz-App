import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleHome extends StatelessWidget {
  TitleHome(this.startPLay_call, {super.key});

  // ignore: non_constant_identifier_names
  VoidCallback startPLay_call;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffa37ce7),
        title: const Text(
          "Movie Quote Quiz",
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      // image -> assets
      Image.asset(
        'assets/images/home_back.jpg',
      ),
      const SizedBox(
        height: 25,
      ),
      const Text(
        'It\'s Movie Quote Quiz Time!',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 214, 63, 118),
              elevation: 8,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              )),
          onPressed: startPLay_call,
          child: const Text(
            'Play',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }
}
