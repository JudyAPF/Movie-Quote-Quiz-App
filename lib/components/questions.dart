import 'package:movie_quote_quiz_app/data/questions_list.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

// ignore: non_constant_identifier_names
final questions_list = QUESTIONS_LIST;
// ignore: non_constant_identifier_names
final answers_list = ANSWERS_LIST;
int questionIndex = 0, answerIndex = 0, ctr = 0, score = 0;
bool isFinished = false;
String messageUserScore = "";

class _QuestionsState extends State<Questions> {
  void checkAnswer(String answer) {
    // ignore: avoid_print
    print(answer);
    //CHECK IF THE ANSWER IS TO BE GIVEN A POINT
    score += answer == answers_list[questionIndex] ? 1 : 0;
    setState(() {
      if (questionIndex < questions_list.length - 1) {
        questionIndex++;
        answerIndex++;
        ctr++;
      } else {
        isFinished = true;
        if (score <= 5) {
          messageUserScore = "You failed";
        }
        if (score >= 6 && score <= 8) {
          messageUserScore = "That's good";
        }
        if (score >= 9 && score <= 10) {
          messageUserScore = "Perfect";
        }
      }
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
      ctr = 0;
      isFinished = false; // Set isFinished to false to show questions again
      messageUserScore = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffa37ce7),
        title: const Text("Movie Quote Quiz"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 50,
          ),
          child: isFinished ? showScore() : showQuestion(),
        ),
      ),
    );
  }

  Widget showQuestion() {
    return Column(
      children: [
        Text(
          // 'Sample Trivia Question',
          questions_list[questionIndex],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 63, 118),
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => checkAnswer(CHOICES[ctr]['A']!),
                child: Text("A. ${CHOICES[ctr]['A']!}"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 63, 118),
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => checkAnswer(CHOICES[ctr]['B']!),
                child: Text("B. ${CHOICES[ctr]['B']!}"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 63, 118),
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => checkAnswer(CHOICES[ctr]['C']!),
                child: Text("C. ${CHOICES[ctr]['C']!}"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 63, 118),
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => checkAnswer(CHOICES[ctr]['D']!),
                child: Text("D. ${CHOICES[ctr]['D']!}"),
              ),
            ),
          ],
        ),
      ],
    );
  }


Widget showScore() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          messageUserScore,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          '$score/${questions_list.length}',
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 29, 219, 29),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: resetQuiz,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 214, 63, 118),
              alignment: Alignment
                  .center, // Align contents (including icon) at the center
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align the Row (icon) at the center
              children: [
                Icon(
                  Icons.refresh, // Icon to be displayed
                  color: Colors.white,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
}