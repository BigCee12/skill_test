import 'package:flutter/material.dart';
import "package:skill_test/homepage.dart";
import 'package:skill_test/data/questions_list.dart';
import 'package:skill_test/questions.dart';
import 'package:skill_test/results.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  var activeScreen = "start_screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }
  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions_screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results_screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = LandingPage(switchScreen);

    if (activeScreen == "questions_screen") {
      screenWidget = Questions(chooseAnswer);
    }
    if (activeScreen == "results_screen") {
      screenWidget = ResultsScreen(onRestart,selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 180, 134, 189),
                Color.fromARGB(255, 94, 158, 211),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
