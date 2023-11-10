import 'package:flutter/material.dart';
import 'package:introapp/apps/quiz_app/data/questions.dart';
import 'package:introapp/apps/quiz_app/models/question_model.dart';
import 'package:introapp/apps/quiz_app/screens/result_screen.dart';
import 'package:introapp/apps/quiz_app/widgets/answer_widget.dart';
import 'package:introapp/apps/quiz_app/widgets/next_button_widget.dart';
import 'package:introapp/apps/quiz_app/widgets/question_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<QuestionModel> _questions = List.of(questions);
  List<QuestionModel> allResults = List.of([]);

  int index = 0;
  int score = 0;
  bool isPressed = false;

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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResultScreen(
                  questions: _questions,
                  allResults: allResults,
                  score: score,
                )));
      }
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 150, 20, 20),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }

  void updateAfterPress(bool value, String key) {
    if (!isPressed && value == true) score += 10;
    isPressed = true;

    //add the pressed answer and the current question as QuestionModel to allResults list for ResultScreen
    allResults.add(QuestionModel(_questions[index].question, {key: value}));
  }

  Map<Padding, bool> listAnswers() {
    return _questions[index].answers.map((key, value) {
      return MapEntry(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  updateAfterPress(value, key);
                });
              },
              child: AnswerWidget(
                answer: key,
                color: isPressed
                    ? value == true
                        ? Colors.green
                        : Colors.red
                    : Colors.transparent,
                fontSize: 16,
              ),
            ),
          ),
          value);
    });
  }

  @override
  Widget build(BuildContext context) {
    int questionsLength = _questions.length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 40, 90),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionWidget(question: _questions[index].question),
            ...listAnswers().keys,
            Text(
              "Question: ${index + 1}/$questionsLength",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: NextButtonWidget(
          nextQuestion: nextQuestion,
        ),
      ),
    );
  }
}
