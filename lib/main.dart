import 'package:movie_quote_quiz_app/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MovieQuoteQuiz());
}

class MovieQuoteQuiz extends StatelessWidget {
  const MovieQuoteQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  } 
}  