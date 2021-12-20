import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/models/transaction.dart';

import 'expense_card.dart';

class ExpenseList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  ExpenseList({ this.transactions, this.removeTransaction });

  @override
  Widget build(BuildContext context) {
    // In older Version Expanded seems to not work quit like this so there
    // one should use the ConstraintBuilder (?)
    return Expanded(
      child: Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text('No Transactions'),
                  Container(
                      height: 200,
                      child: Image(image: AssetImage('assets/images/waiting.png'), fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
            // this can actually be scrolled behind the status bar sometimes
            // use SafeNavigator on the singlechildscrollview or whatever is
            // scrollable to prevent this from happening
              itemBuilder: (ctx, index) {
                return ExpenseCard(transactions[index], removeTransaction);
              },
              itemCount: transactions.length,
            ),
      ),
    );
  }
}
