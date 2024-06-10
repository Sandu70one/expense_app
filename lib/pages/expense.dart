import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/widgets/add_new_expense_modal.dart';
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

//function to open a the modal sheet
  void _openExpenseModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddNewExpenseModal();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses  ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0, //Removes Shadow
        backgroundColor: Colors.brown[400],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.white,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: _openExpenseModal,
              icon: const Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ExpenseCardTile(
            expenseList: _expenseList,
          ),
        ],
      ),
    );
  }
}
