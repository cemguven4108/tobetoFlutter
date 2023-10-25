//android view package
import 'package:flutter/material.dart';

//ios view package
//import 'package:flutter/cupertino.dart';

void main() {
  String message = "Hello My First Application";
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(message)),
        body: Center(child: Text("Body")),
      ),
    ),
  );
}
