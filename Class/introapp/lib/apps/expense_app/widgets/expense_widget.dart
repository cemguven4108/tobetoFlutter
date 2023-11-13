import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
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
