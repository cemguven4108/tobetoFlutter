import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseField extends StatelessWidget {
  const ExpenseField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
  });

  final String hintText;
  final Icon? prefixIcon;
  final bool readOnly;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Theme.of(context).cardTheme.color,
        child: ListTile(
          title: Center(
            child: TextFormField(
              readOnly: readOnly,
              keyboardType: keyboardType,
              controller: controller,
              inputFormatters: inputFormatters,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
              ),
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
