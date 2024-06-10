// import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/expense.dart';


class AddNewExpenseModal extends StatefulWidget {
  
  const AddNewExpenseModal({super.key});

  @override
  State<AddNewExpenseModal> createState() => _AddNewExpenseModalState();
}

class _AddNewExpenseModalState extends State<AddNewExpenseModal> {
  //add controllers
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  Category _selectedCategory = Category.food;

  //date variables
  final DateTime initialDate = DateTime.now();
  //first - last dates are specify the range the user can select through the modal
  final firstDate = DateTime(DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
  final lastDate = DateTime(DateTime.now().year + 1, DateTime.now().month, DateTime.now().day);

  DateTime _selectedDate = DateTime.now();

  //date picker modal
  Future<void> openDateModel() async {
    try {
      final pickedDate = await showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate);
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    } catch (error) {
      print("Error in date picker: $error");
    }
  }

  //add expense function
  Future _addExpense() async {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    final description = _descriptionController.text.trim();

    if (title.isEmpty || amount <= 0 || description.isEmpty) {
      return(
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text('Please enter a valid title, amount and description.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        )
      
      );
    }

    final newExpense = ExpenseModel(
      title: title,
      amount: amount,
      date: _selectedDate,
      category: _selectedCategory,
      description: description,
    );

    //add the new expense to the list
    // _expenseList.add(newExpense);

    //close the modal
    Navigator.pop(context);
  }

  @override
  //dispose controllers
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Add New Expense',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Amount',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Category"),
              DropdownButton(
                value: _selectedCategory,
                //give the model's enum values of category for the drop down menu
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          child: Text(category.toString().split('.').last),
                          //this value means the enum value selected in the drop down
                          value: category,
                        ))
                    .toList(),
                onChanged: (value) => {
                  //controller value change each time when select the drop down menu values
                  // print(_selectedCategory),
                  setState(() {
                    _selectedCategory = value as Category;
                  })
                },
              ),
              Text(formattedDate.format(_selectedDate)),
              IconButton(
                  onPressed: openDateModel, icon: Icon(Icons.calendar_month)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addExpense,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  'Add Expense',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
