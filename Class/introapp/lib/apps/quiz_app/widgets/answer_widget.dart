import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({super.key, required this.answer,required this.color, required this. fontSize});

  final String answer;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          answer,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, color: Colors.white70),
        ),
      ),
    );
  }
}
