//android view package
import 'package:flutter/material.dart';

//ios view package
//import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String message = "Hello My First Application";

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("See Result"),
          onPressed: () {

            int score = 55;
            String result;

            if (score >= 50) {
              result = "Passed";
            } else if(score >= 40) {
              result = "Make-Up Exam";
            } else {
              result = "Failed";
            }

            var alert = AlertDialog(
              title: const Text("Result"),
              content: Text(result),
            );

            showDialog(context: context, builder: (BuildContext context) => alert);
          },
        ),
      ),
    );
  }
}
