import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({super.key, required this.expense});

  final Expense expense;

  String formatDate(DateTime date) {
    var outputFormat = DateFormat("dd ${DateFormat.MONTH} HH:mm");
    return outputFormat.format(date);
  }

  String formatPrice(double price) {
    return price.toStringAsFixed(2);
  }

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("${formatPrice(expense.price)} TL"),
                Text(formatDate(expense.date)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
