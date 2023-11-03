import 'package:flutter/material.dart';
import 'package:introapp/answer_widget.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/home_screen.dart';
import 'package:introapp/models/question_model.dart';
import 'package:introapp/next_button.dart';
import 'package:introapp/question_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<QuestionModel> _questions = List.of(questions);

  int index = 0;
  void nextQuestion() {
    setState(() {
      if ((index + 1) < _questions.length) {
        index++;
      } else {
        //Temporary Solution Before The Implementation of Results Screen
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int questionLength = _questions.length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 40, 90),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionWidget(question: _questions[index].question),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AnswerWidget(
                  answers: _questions[index].answers,
                  correctAnswer: _questions[index].correctAnswer),
            ),
            Text(
              "Question: ${index + 1}/$questionLength",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
