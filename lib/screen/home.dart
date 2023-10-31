import 'package:movie_quote_quiz_app/components/questions.dart';
import 'package:movie_quote_quiz_app/components/title_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool toPLay = false;

  void startPLay() {
    setState(() {
      toPLay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffa37ce7),
      body: toPLay? const Questions() : TitleHome(startPLay),
    );
  }
}