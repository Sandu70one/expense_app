import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';

class ExpenseCardTile extends StatelessWidget {
  const ExpenseCardTile({super.key, required this.expenseList});

  final List<ExpenseModel> expenseList;

  @override
  Widget build(BuildContext context) {
    return  //expanded widget to fill the remaining space(let get the area for the list view)
          Expanded(
            child: ListView.builder(
              itemCount: expenseList.length, //number of items in the list
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.brown[50],
                  child: ListTile(
                    title: Text(
                      expenseList[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(expenseList[index].category.name),
                        const SizedBox(width: 10),
                        Text(
                          expenseList[index].description,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          expenseList[index].getFormattedDate,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    // ThreeLine: true,
                    selected: true,
                    leading:  Icon(
                      categoryIcons[expenseList[index].category],
                      color: Colors.brown,
                      size: 35,
                    ),
                    onTap: () {},
                    trailing: Text(
                     '\$${expenseList[index].amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          );
  }
}