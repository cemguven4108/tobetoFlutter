import 'package:flutter/material.dart';

class ChartBarWidget extends StatelessWidget {
  const ChartBarWidget({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FractionallySizedBox(
          heightFactor: height,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.deepPurple,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
