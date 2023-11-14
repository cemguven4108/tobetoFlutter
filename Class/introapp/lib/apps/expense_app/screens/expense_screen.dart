import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/data/my_expenses.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/app_bar_widget.dart';
import 'package:introapp/apps/expense_app/widgets/expense_list_widget.dart';
import 'package:introapp/apps/expense_app/widgets/scroll_view_widget.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Expense> expenses = List.of(myExpenses);

  void addExpense(String name, double price, DateTime date) {
    setState(() {
      expenses.add(Expense(
        name: name,
        price: price,
        date: date,
      ));
    });
  }

  String totalExpense() {
    double total = 0;

    for (Expense expense in expenses) {
      total += expense.price;
    }

    return "${total.ceil()} TL";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ScrollViewWidget(
        headerSliverBuilder: <Widget>[
          AppBarWidget(underTitle: totalExpense(), onAddExpense: addExpense),
        ],
        body: ExpenseListWidget(
          expenses: expenses,
        ),
      ),
    );
  }
}
