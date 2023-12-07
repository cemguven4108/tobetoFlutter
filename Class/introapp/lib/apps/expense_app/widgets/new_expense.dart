import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:introapp/apps/expense_app/models/enums/category.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';
import 'package:introapp/apps/expense_app/widgets/dropdown_button_widget.dart';
import 'package:introapp/apps/expense_app/widgets/expense_field.dart';

class NewExpense extends StatelessWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final Function onAddExpense;

  void onAddExpenseAction(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController priceController,
    TextEditingController dateController,
    Category selectedCategory,
  ) {
    if (nameController.text == "" ||
        priceController.text == "" ||
        dateController.text == "") {
      showMessage(context, "Please fill in the blanks");
    } else {
      onAddExpense(Expense(
        name: nameController.text,
        price: double.parse(priceController.text),
        date: DateTime.parse(dateController.text),
        category: selectedCategory,
      ));
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
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    Category selectedCategory = Category.other;

    return SizedBox(
      height: 400,
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
          DropdownButtonWidget(selectedCategory: selectedCategory),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black54),
            ),
            onPressed: () => onAddExpenseAction(
              context,
              nameController,
              priceController,
              dateController,
              selectedCategory,
            ),
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
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
