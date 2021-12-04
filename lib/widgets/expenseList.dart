import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/models/transaction.dart';

import 'expenseCard.dart';

class ExpenseList extends StatefulWidget {

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<Transaction> transactions = [
    Transaction(id: '1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Food', amount: 37.15, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return  ExpenseCard(transaction);
      }).toList(),
    );
  }
}
