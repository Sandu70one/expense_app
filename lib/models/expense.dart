import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//use uuid for create id for each expense
final uuid = const Uuid().v4();

//date format
final formattedDate = DateFormat.yMMMMEEEEd();

//enum for category
enum Category { food, travel, leisure, work }

//assign category icons
final categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};


class ExpenseModel {
  //user defining attributes
  final String title;
  final double amount;
  final String description;
  final Category category;
  final DateTime date;

  //auto generate attribute values
  final String id;

  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category,
      required this.description})
      : id = uuid;

  //define getter that format date, then you can use this function in parent widget with formatted date
  String get getFormattedDate {
    return formattedDate.format(date);
  }
}
