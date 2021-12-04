import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/models/transaction.dart';

import 'expense_card.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> transactions;

  ExpenseList({ this.transactions });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ExpenseCard(transactions[index]);
        },
        itemCount: transactions.length,
      ),
      // child: ListView(
      //   children: transactions.map((transaction) {
      //     return  ExpenseCard(transaction);
      //   }).toList(),
      // ),
    );
  }
}
