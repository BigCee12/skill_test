//import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const startAlignmnent = Alignment.topLeft;
// const endAlignmnent = Alignment.bottomRight;

class LandingPage extends StatelessWidget {
  const LandingPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
