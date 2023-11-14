import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:introapp/apps/expense_app/widgets/new_expense_field.dart';

class NewExpense extends StatelessWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function onAddExpense;

  void pickDate(BuildContext context, TextEditingController controller) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    ).then(
      (selectedDate) {
        if (selectedDate != null) {
          DateTime selectedDateTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            DateTime.now().hour,
            DateTime.now().minute,
          );
          controller.text =
              DateFormat("yyyy-MM-dd HH:mm").format(selectedDateTime);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    return SizedBox(
      height: 350,
      child: Column(
        children: [
          NewExpenseField(
            hintText: "Title: ",
            controller: nameController,
            prefixIcon: const Icon(Icons.title),
          ),
          NewExpenseField(
            hintText: "Price: ",
            controller: priceController,
            prefixIcon: const Icon(Icons.attach_money),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          NewExpenseField(
            hintText: "Date: ",
            controller: dateController,
            prefixIcon: const Icon(Icons.date_range),
            readOnly: true,
            onTap: () async {
              pickDate(context, dateController);
            },
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black54),
            ),
            onPressed: () {
              if (nameController.text == "" ||
                  priceController.text == "" ||
                  dateController.text == "") {
                showMessage(context, "Please fill in the blanks");
              } else {
                onAddExpense(
                    nameController.text,
                    double.parse(priceController.text),
                    DateTime.parse(dateController.text));
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              "Add Expense",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 150, 20, 20),
        behavior: SnackBarBehavior.fixed,
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
