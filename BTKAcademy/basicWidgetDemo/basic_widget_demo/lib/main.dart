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

class MyApp extends StatelessWidget {
  String message = "Hello My First Application";

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
            var alert = const AlertDialog(
              title: Text("Result"),
              content: Text("Passed"),
            );

            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
      ),
    );
  }
}
