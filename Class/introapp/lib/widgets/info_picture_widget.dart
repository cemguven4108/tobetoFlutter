import 'package:flutter/material.dart';

class InfoPictureWidget extends StatelessWidget {
  const InfoPictureWidget({super.key, required this.pictureLocation});

  final String pictureLocation;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(pictureLocation),
    );
  }
}
