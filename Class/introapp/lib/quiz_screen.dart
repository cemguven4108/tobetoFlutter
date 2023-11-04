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

  bool isPressed = false;

  int index = 0;
  void nextQuestion() {
    setState(() {
      if ((index + 1) < _questions.length) {
        if (isPressed) {
          index++;
          isPressed = false;
        } else {
          showErrorMessage();
        }
      } else {
        //Temporary Solution Before The Implementation of Results Screen
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  void showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Center(
          child: Text(
            "Please Answer The Question First!",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  void changeColor() {
    setState(() {
      isPressed = true;
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
            ..._questions[index].answers.map((answer) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                child: AnswerWidget(
                    answer: answer,
                    color: isPressed
                        ? _questions[index].correctAnswer == answer
                            ? Colors.greenAccent
                            : Colors.redAccent
                        : Colors.white,
                    onTap: changeColor),
              );
            }),
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