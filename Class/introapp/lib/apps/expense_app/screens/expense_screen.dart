import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/data/my_expenses.dart';
import 'package:introapp/apps/expense_app/models/enums/category.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/app_bar_widget.dart';
import 'package:introapp/apps/expense_app/widgets/chart_widget.dart';
import 'package:introapp/apps/expense_app/widgets/expense_widget.dart';
import 'package:introapp/apps/expense_app/widgets/scroll_view_widget.dart';
import 'package:introapp/apps/expense_app/widgets/update_expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Expense> expenses = List.of(myExpenses);

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void updateExpense(
      String id, String name, double price, DateTime date, Category category) {
    for (Expense expense in expenses) {
      if (expense.id == id) {
        setState(() {
          expense.name = name;
          expense.price = price;
          expense.date = date;
          expense.category = category;
        });
        return;
      }
    }
  }

  String totalExpense() {
    double total = 0;

    for (Expense expense in expenses) {
      total += expense.price;
    }

    return "$total TL";
  }

  void showMessage(BuildContext context, Expense removedExpense, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        content: Text(
          "${removedExpense.name} Removed",
        ),
        action: SnackBarAction(
          label: "Undo",
          textColor: Theme.of(context).snackBarTheme.actionTextColor,
          onPressed: () {
            setState(
              () => expenses.insert(index, removedExpense),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple.shade900,
              Colors.blue.shade900,
              Colors.deepOrange.shade900,
            ],
          ),
        ),
        child: ScrollViewWidget(
          headerSliverBuilder: <Widget>[
            AppBarWidget(
              underTitle: totalExpense(),
              onAddExpense: addExpense,
            ),
          ],
          body: Column(
            children: [
              ChartWidget(expenses: expenses),
              ListView.builder(
                itemCount: expenses.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(expenses[index].id),
                    onDismissed: (direction) {
                      setState(() {
                        Expense removedExpense = expenses.removeAt(index);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        showMessage(context, removedExpense, index);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onLongPress: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return UpdateExpense(
                                expenseToUpdate: expenses[index],
                                updateExpense: updateExpense,
                              );
                            },
                          );
                        },
                        child: ExpenseWidget(expense: expenses[index]),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
