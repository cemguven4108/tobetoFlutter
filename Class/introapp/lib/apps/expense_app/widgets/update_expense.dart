import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/expense_field.dart';

class UpdateExpense extends StatelessWidget {
  const UpdateExpense({
    super.key,
    required this.expenseToUpdate,
    required this.updateExpense,
  });

  final Expense expenseToUpdate;
  final Function updateExpense;

  void updateExpenseAction(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController priceController,
    TextEditingController dateController,
  ) {
    if (nameController.text == "" ||
        priceController.text == "" ||
        dateController.text == "") {
      showMessage(context, "Please fill in the blanks");
    } else {
      updateExpense(
        expenseToUpdate.id,
        nameController.text,
        double.parse(priceController.text),
        DateTime.parse(dateController.text),
      );
      Navigator.of(context).pop();
    }
  }

  void writeDateToTextField(
      TextEditingController controller, DateTime? pickedDate) {
    if (pickedDate != null) {
      controller.text = DateFormat("yyyy-MM-dd HH:mm").format(pickedDate);
    }
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now(),
    ).then(
      (selectedDate) {
        if (selectedDate != null) {
          return DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            DateTime.now().hour,
            DateTime.now().minute,
          );
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: expenseToUpdate.name);
    TextEditingController priceController =
        TextEditingController(text: expenseToUpdate.price.toString());
    TextEditingController dateController =
        TextEditingController(text: DateFormat("yyyy-MM-dd HH:mm").format(expenseToUpdate.date));

    return SizedBox(
      height: 350,
      child: Column(
        children: [
          ExpenseField(
            hintText: "Title: ",
            controller: nameController,
            prefixIcon: const Icon(Icons.title),
          ),
          ExpenseField(
            hintText: "Price: ",
            controller: priceController,
            prefixIcon: const Icon(Icons.attach_money),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          ExpenseField(
            hintText: "Date: ",
            controller: dateController,
            prefixIcon: const Icon(Icons.date_range),
            readOnly: true,
            onTap: () async {
              writeDateToTextField(dateController, await pickDate(context));
            },
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black54),
            ),
            onPressed: () {
              updateExpenseAction(
                context,
                nameController,
                priceController,
                dateController,
              );
            },
            child: const Text(
              "Update Expense",
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
