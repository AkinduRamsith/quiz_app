import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.answerList,
    required this.onAction,
    required this.correctAnswersCount,
  });

  final List<String> answerList;
  final Function(String value) onAction;
  final int correctAnswersCount;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': question[i].question,
        'correct_answer': question[i].answers[0],
        'user_answer': answerList[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Result Screen ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 119, 99, 7), fontSize: 36),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Correct Answers: $correctAnswersCount out of ${question.length}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 65, 5, 125), fontSize: 26),
            ),
            const SizedBox(
              height: 20,
            ),
            // ...getSummary().map((s)=>Text(s['question'].toString())),
            // ...getSummary().map((s)=>Text(s['correct_answer'].toString())),
            // ...getSummary().map((s)=>Text(s['user_answer'].toString())),
            ...getSummary().map(
              (s) => SizedBox(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '${(s['questionIndex'] as int) + 1}. ${s['question']}',
                          style: const TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          s['correct_answer'].toString(),
                          style: const TextStyle(
                              fontSize: 25, color: Colors.green),
                        ),
                        Text(
                          s['user_answer'].toString(),
                          style: TextStyle(
                            fontSize: 25,
                            color: s['correct_answer'].toString() ==
                                    s['user_answer'].toString()
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  onAction('start');
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 231, 1, 1), 
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white, 
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: Colors.blue), 
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), 
                    ),
                  ),
                ),
                child: const Text('Restart'))
          ],
        ),
      ),
    );
  }
}
