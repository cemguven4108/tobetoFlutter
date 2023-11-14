import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key, required this.info, required this.color});

  final String info;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          height: 20,
          color: color,
        ),
        Text(
          info,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          width: 100,
          height: 20,
          color: color,
        )
      ],
    );
  }
}
