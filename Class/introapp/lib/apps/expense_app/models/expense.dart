import 'package:uuid/uuid.dart';

class Expense {
  String id;
  final String name;
  final double price;
  final DateTime date;

  Expense({required this.name, required this.price, required this.date})
      : id = const Uuid().v4();
}
