import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/screens/expense_screen.dart';

class ExpenseHomeScreen extends StatefulWidget {
  const ExpenseHomeScreen({super.key});

  @override
  State<ExpenseHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<ExpenseHomeScreen> {

  void routeTo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExpenseScreen()));
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
            image: AssetImage("assets/images/expense_image.png"),
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
          routeTo();
        },
        child: const Text("See Expenses", style: TextStyle(color: Colors.white70),),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
