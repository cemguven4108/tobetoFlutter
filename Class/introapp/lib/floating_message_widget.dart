import 'package:flutter/material.dart';

class FloatingMessageWidget extends StatelessWidget {
  const FloatingMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _successMessage(context);
  }

  _successMessage(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
