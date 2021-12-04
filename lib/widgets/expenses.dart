import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/models/transaction.dart';

import 'expense_list.dart';
import 'package:flutter_tutorial_expenses/widgets/expense_list.dart';

import 'new_expense.dart';

class Expenses extends StatefulWidget {

  @override
  _Expenses createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Transaction> transactions = [
    Transaction(id: '1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Food', amount: 37.15, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount){
    final newTransaction = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NewExpense(titleController: titleController, amountController: amountController, addTx: addNewTransaction),
        Card(child: Container(width: double.infinity, color: Colors.deepOrange, child: Text('Charts')), elevation: 5,),
        ExpenseList(transactions: transactions),
      ]
    );
  }
}
