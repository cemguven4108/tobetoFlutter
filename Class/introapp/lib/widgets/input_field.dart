import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.controller,
    this.inputFormatters,
  });

  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: ListTile(
          title: Center(
            child: TextFormField(
              obscureText: obscureText,
              inputFormatters: inputFormatters,
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration:
                  InputDecoration(hintText: hintText, prefixIcon: prefixIcon),
            ),
          ),
        ),
      ),
    );
  }
}
