import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/data/my_expenses.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/app_bar_widget.dart';
import 'package:introapp/apps/expense_app/widgets/expense_list_widget.dart';
import 'package:introapp/apps/expense_app/widgets/pop_up_widget.dart';
import 'package:introapp/apps/expense_app/widgets/scroll_view_widget.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Expense> expenses = List.of(myExpenses);

  Widget onLogoutAction() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.logout,
        color: Colors.white70,
      ),
    );
  }

  Widget onAddAction() {
    return PopUpWidget(func: addExpense);
  }

  void addExpense(String name, double price) {
    setState(() {
      expenses.add(Expense(
        name: name,
        price: price,
        date: DateTime.now(),
      ));
    });
  }

  String totalExpense() {
    double total = 0;

    for (Expense expense in expenses) {
      total += expense.price;
    }

    return total.ceil().toString();
  }

  Widget buildAppBar() {
    return AppBarWidget(
      title: "Expenses",
      centerTitle: true,
      leading: onLogoutAction(),
      actions: [
        onAddAction(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ScrollViewWidget(
        headerSliverBuilder: <Widget>[
          buildAppBar(),
        ],
        body: ExpenseListWidget(
          expenses: expenses,
        ),
      ),
    );
  }
}
