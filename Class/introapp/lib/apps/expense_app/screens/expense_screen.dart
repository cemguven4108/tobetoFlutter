import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:introapp/apps/expense_app/data/my_expenses.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/app_expense_widget.dart';
import 'package:introapp/apps/expense_app/widgets/app_sliver_appbar.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  bool isFabVisible = false;
  ScrollController controller = ScrollController();
  List<Expense> expenses = List.of(myExpenses);

  bool changeUpButtonVisibility(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.forward) {
      setState(() => isFabVisible = false);
    } else if (notification.direction == ScrollDirection.reverse) {
      setState(() => isFabVisible = true);
    }
    return true;
  }

  void scrollUp() {
    controller.animateTo(
      controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  Widget appBarAddAction() {
    return GestureDetector(
      onTap: () {
        createAlertDialog(context);
      },
      child: const Icon(Icons.add_circle, color: Colors.white70),
    );
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

  Widget appBarLeadingLogoutAction() {
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

  Widget appBarUser() {
    return const Icon(Icons.verified_user, color: Colors.white70);
  }

  String totalExpense() {
    double total = 0;

    for (Expense expense in expenses) {
      total += expense.price;
    }

    return total.ceil().toString();
  }

  Center listExpenses() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Graphic", style: TextStyle(color: Colors.white70)),
          Text(
            "Total Expense: ${totalExpense()} TL",
            style: const TextStyle(color: Colors.white),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AppExpenseWidget(
                  expense: expenses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 150, 20, 20),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }

  Future createAlertDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("New Expense"),
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name: "),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: priceController,
                  decoration: const InputDecoration(labelText: "Price: "),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: const Text("OK"),
              onPressed: () {
                if (nameController.text == "" || priceController.text == "") {
                  showMessage("Please fill in the blanks");
                } else {
                  addExpense(
                      nameController.text, double.parse(priceController.text));
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: NestedScrollView(
        controller: controller,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          AppSliverAppBar(
            add: appBarAddAction(),
            logout: appBarLeadingLogoutAction(),
            user: appBarUser(),
          ),
        ],
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            return changeUpButtonVisibility(notification);
          },
          child: listExpenses(),
        ),
      ),
      floatingActionButton: isFabVisible
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                scrollUp();
              },
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
