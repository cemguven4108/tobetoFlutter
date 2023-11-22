import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/screens/expense_screen.dart';

class ExpenseHomeScreen extends StatelessWidget {
  const ExpenseHomeScreen({super.key});

  ElevatedButton seeExpensesButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.deepOrange.withAlpha(100)),
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ExpenseScreen()));
      },
      child: const Text(
        "See Expenses",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900.withOpacity(0.8),
              Colors.deepPurple.shade900.withOpacity(0.8),
              Colors.deepOrange.shade900.withOpacity(0.8),
            ],
          ),
          image: const DecorationImage(
            opacity: 0.6,
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
