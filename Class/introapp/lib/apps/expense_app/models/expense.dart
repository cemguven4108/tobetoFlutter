import 'package:uuid/uuid.dart';

class Expense {
  String id;
  String name;
  double price;
  DateTime date;

  Expense({required this.name, required this.price, required this.date})
      : id = const Uuid().v4();
}
