import 'package:introapp/apps/expense_app/models/enums/category.dart';
import 'package:uuid/uuid.dart';

class Expense {
  String id;
  String name;
  double price;
  DateTime date;
  Category category;

  Expense({required this.name, required this.price, required this.date, required this.category})
      : id = const Uuid().v4();
}

class CategoryExpenses {
  const CategoryExpenses({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  double get totalCategoryPrice {
    double sum = 0;

    for (Expense expense in expenses) {
      sum += expense.price;
    }
    return sum;
  }
}