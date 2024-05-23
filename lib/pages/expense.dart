import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/widgets/expense_card_tile.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
// hard coded the sample data
  final List<ExpenseModel> _expenseList = [
    ExpenseModel(
        title: 'Food',
        amount: 100,
        date: DateTime.now(),
        description: 'Lunch',
        category: Category.food),
    ExpenseModel(
        title: 'Travel',
        amount: 200,
        date: DateTime.now(),
        description: 'Flight',
        category: Category.travel),
    ExpenseModel(
        title: 'Leisure',
        amount: 300,
        date: DateTime.now(),
        description: 'Movie',
        category: Category.leisure),
    ExpenseModel(
        title: 'Work',
        amount: 400,
        date: DateTime.now(),
        description: 'Meeting',
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0, //Removes Shadow
        backgroundColor: Colors.brown[400],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
         ExpenseCardTile(expenseList: _expenseList,),
         
        ],
      ),
    );
  }
}
