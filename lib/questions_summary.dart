import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(summaryData.length, (index) {
            final int questionIndex = index + 1;
            final Map<String, Object> data = summaryData[index];
            final bool isAnswerCorrect =
                data["user_answer"] == data["correct_answer"];
            final Color answerColor = isAnswerCorrect
                ? const Color(0xFFD4CFCF)
                : const Color(0xFF8F4F4F);

            return ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: answerColor,
                    child: Text(
                      questionIndex.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                data["question"] as String,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    "Your answer: ${data["user_answer"]}",
                    style: GoogleFonts.lato(
                      color: answerColor,
                    ),
                  ),
                  Text(
                    "Correct answer: ${data["correct_answer"]}",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
