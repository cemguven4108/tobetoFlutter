import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';

class AppExpenseWidget extends StatelessWidget {
  const AppExpenseWidget({super.key, required this.expense});

  final Expense expense;

  Color changeColorBasedOnPrice(double price) {
    if (price >= 1000) {
      return Colors.pink;
    } else if (price >= 500) {
      return Colors.redAccent;
    } else {
      return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: changeColorBasedOnPrice(expense.price),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              expense.name,
              style: const TextStyle(color: Colors.black),
            ),
            Text("${expense.price.toInt()} TL"),
          ],
        ),
      ),
    );
  }
}
