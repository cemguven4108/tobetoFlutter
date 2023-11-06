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
  int score = 0;
  int index = 0;

  void nextQuestion() {
    setState(() {
      if ((index + 1) < _questions.length) {
        if (isPressed) {
          index++;
          isPressed = false;
        } else {
          showMessage("Please Answer The Question First!");
        }
      } else {
        //Temporary Solution Before The Implementation of Results Screen
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  void checkAnswerAndUpdate(String answer) {
    setState(() {
      if (!isPressed && answer == _questions[index].correctAnswer) {
        score += 10;
      }
      isPressed = true;
    });
  }

  Iterable<Padding> giveMeAnswers() {
    return _questions[index].answers.map((answer) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: GestureDetector(
          onTap: () {
            checkAnswerAndUpdate(answer);
          },
          child: AnswerWidget(
            answer: answer,
            color: isPressed
                ? _questions[index].correctAnswer == answer
                    ? Colors.greenAccent
                    : Colors.redAccent
                : Colors.white,
          ),
        ),
      );
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
            ...giveMeAnswers(),
            Text(
              "Question: ${index + 1}/$questionLength",
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "Score: $score",
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
