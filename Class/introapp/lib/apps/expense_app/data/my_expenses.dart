import 'package:introapp/apps/expense_app/models/enums/category.dart';
import 'package:introapp/apps/expense_app/models/expense.dart';

List<Expense> myExpenses = [
  Expense(
    name: "Living Expenses",
    price: 200,
    date: DateTime(2022, 5, 15, 11, 37),
    category: Category.food,
  ),
  Expense(
    name: "QoL Expenses",
    price: 500,
    date: DateTime(2022, 5, 15, 11, 37),
    category: Category.other,
  ),
  Expense(
    name: "Clothes",
    price: 1500,
    date: DateTime(2021, 1, 22, 14, 07),
    category: Category.dress,
  ),
  Expense(
    name: "Car",
    price: 8250.5,
    date: DateTime.now(),
    category: Category.other,
  ),
  Expense(
    name: "Vacation",
    price: 2500,
    date: DateTime(2023, 5, 8, 09, 00),
    category: Category.travel,
  ),
];
