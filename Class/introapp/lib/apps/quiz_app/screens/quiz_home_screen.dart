import 'package:flutter/material.dart';
import 'package:introapp/apps/quiz_app/screens/quiz_screen.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {

  void startQuiz() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuizScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/quiz_image.jpg"),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: const ButtonStyle(
          shadowColor: MaterialStatePropertyAll(Colors.transparent),
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 20, 20, 20)),
          fixedSize: MaterialStatePropertyAll(Size.fromWidth(125)),
        ),
        onPressed: () {
          startQuiz();
        },
        child: const Text("Quiz Up!", style: TextStyle(color: Colors.white70),),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
