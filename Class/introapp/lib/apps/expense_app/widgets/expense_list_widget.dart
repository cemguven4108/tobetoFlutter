import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/expense_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ExpenseWidget(expense: expenses[index]);
      },
    );
  }
}
