import 'package:flutter/material.dart';
import 'package:introapp/apps/expense_app/models/enums/category.dart';

// ignore: must_be_immutable
class DropdownButtonWidget extends StatefulWidget {
  DropdownButtonWidget({super.key, required this.selectedCategory});

  Category selectedCategory;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.selectedCategory,
      items: Category.values.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(
            category.name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            widget.selectedCategory = value;
          });
        }
      },
    );
  }
}
