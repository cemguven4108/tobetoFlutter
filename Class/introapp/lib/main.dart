import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:introapp/apps/expense_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: ThemeData().textTheme.copyWith(
              titleSmall: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: Colors.white,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white70,
              ),
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
              bodySmall: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              bodyMedium: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
        snackBarTheme: ThemeData().snackBarTheme.copyWith(
          actionTextColor: Colors.blue.shade700,
          backgroundColor: Colors.red.shade800,
        ),
        iconTheme: ThemeData().iconTheme.copyWith(
          color: Colors.white,
        ),
        cardTheme: ThemeData().cardTheme.copyWith(
          color: Colors.white70,
        ),
      ),
      home: const ExpenseHomeScreen(),
    );
  }
}
