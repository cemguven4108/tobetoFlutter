import 'package:flutter/material.dart';
import 'package:introapp/screens/login_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: LoginScreen(),
    ),
  );
}