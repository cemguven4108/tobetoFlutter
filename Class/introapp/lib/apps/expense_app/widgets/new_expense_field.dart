import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpenseField extends StatelessWidget {
  const NewExpenseField({
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
    return Card(
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
    );
  }
}
