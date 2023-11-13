import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({super.key, required this.func});

  final Function(String name, double price) func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        createAlertDialog(context);
      },
      child: const Icon(Icons.add_circle, color: Colors.white70),
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
                  showMessage(context, "Please fill in the blanks");
                } else {
                  func(nameController.text, double.parse(priceController.text));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void showMessage(BuildContext context, String message) {
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
}
