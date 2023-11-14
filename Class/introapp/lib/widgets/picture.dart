import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  const Picture({super.key, required this.pictureLocation});

  final String pictureLocation;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(pictureLocation),
    );
  }
}
