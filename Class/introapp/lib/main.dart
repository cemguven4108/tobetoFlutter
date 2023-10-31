import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomeWidget(),
    ),
  );
}

class MyHomeWidget extends StatelessWidget {
  static const image = "assets/Warframe0000.jpg";
  static const myName = "Cem Guven";
  static const myClass = "Tobeto - Mobil Gelistirici - 1B";
  String date = DateFormat.yMd().format(DateTime.timestamp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 37, 183),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 100,
            ),
            const Text(
              myName,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const Text(
              myClass,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

// Add your own picture to the main screen
// Your name and surname
// Tobeto - Mobil Gelistirme - 1B
// Display current time