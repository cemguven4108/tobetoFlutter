import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/screens/expense_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  ElevatedButton seeExpensesButton(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
        backgroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 20, 20, 20)),
        fixedSize: MaterialStatePropertyAll(Size.fromWidth(125)),
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ExpenseScreen()));
      },
      child: const Text(
        "See Expenses",
        style: TextStyle(color: Colors.white70),
      ),
    );
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
      floatingActionButton: seeExpensesButton(context),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
