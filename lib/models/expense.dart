import 'package:uuid/uuid.dart';

//use uuid for create id for each expense
final uuid = const Uuid().v4();

//enum for category
enum Category { food, travel, leisure, work }

class ExpenseModel {
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String description;
  final String id;

  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category,
      required this.description})
      : id = uuid;
}
