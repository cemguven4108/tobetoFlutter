import 'package:flutter/material.dart';

class PopMessage extends StatelessWidget {
  const PopMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SnackBar(
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
