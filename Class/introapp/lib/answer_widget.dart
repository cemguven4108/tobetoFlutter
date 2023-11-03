import 'package:flutter/material.dart';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({Key? key, required this.answers, required this.correctAnswer}) : super(key: key);

  final List<String> answers;
  final String correctAnswer;

  @override
  State<StatefulWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {

  void checkCorrectAnswer(String answer) {
    if (widget.correctAnswer == answer) {
      print("Correct");
    } else {
      print("Incorrect");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.answers.map((answer) {
          return GestureDetector(
            onTap: () {
              checkCorrectAnswer(answer);
            },
            child: Card(
              child: ListTile(
                title: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}