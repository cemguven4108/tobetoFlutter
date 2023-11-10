import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({super.key, required this.hintText, this.obscureText = false , this.prefixIcon, this.controller});

  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: ListTile(
          title: Center(
            child: IntrinsicWidth(
              child: TextFormField(
                obscureText: obscureText,
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                decoration:
                    InputDecoration(hintText: hintText, prefixIcon: prefixIcon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
