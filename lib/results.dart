import 'package:flutter/material.dart';
import 'package:skill_test/data/questions_list.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skill_test/questions_summary.dart';



class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onRestart,this.choosenAnswers, {super.key});

  final void Function() onRestart;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getChosenAnswers() {
      final List<Map<String, Object>> answerList = [];
      

      for (int i = 0; i < choosenAnswers.length; i++) {
        answerList.add({
          "question_index": i,
          "question": questions[i].questionText,
          "correct_answer": questions[i].answers[0],
          "user_answer": choosenAnswers[i],
        });
      }

      return answerList;
    }

    
  @override
  Widget build(BuildContext context) {
    final summaryData = getChosenAnswers();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
          (data) => data["user_answer"] == data["correct_answer"],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly",
              style: GoogleFonts.lato(
                color:const  Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
           const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
           const  SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon:const Icon(Icons.refresh_rounded),
              label:const Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}

