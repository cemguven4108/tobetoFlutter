import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({super.key, required this.answer, required this.color});

  final String answer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          answer,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}