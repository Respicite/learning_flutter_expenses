import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

import 'expense_bar.dart';

class ExpenseChart extends StatelessWidget {
  final List<Transaction> transactions;

  ExpenseChart({this.transactions});

  List<ExpenseBar> get groupedTransactionValues{
    var maxSum = 0.0;

    for(var i = 0; i < transactions.length; i++){
      if(transactions[i].date.isAfter(DateTime.now().subtract(const Duration(days: 6)))){
        maxSum += transactions[i].amount;
      }
    }

    return List.generate(7, (index) {
      final day = DateTime.now().subtract(Duration(days: 6-index));
      final dayDMY = DateFormat('dMy').format(day);
      final dayShort = DateFormat('E').format(day);

      var totalSum = 0.0;

      for(var i = 0; i < transactions.length; i++){
        if(DateFormat('dMy').format(transactions[i].date) == dayDMY){
          totalSum += transactions[i].amount;
        }
      }

      return ExpenseBar(amount: totalSum, maxAmount: maxSum, day: dayShort,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues,
          )
      ),
      elevation: 5,
      margin: EdgeInsets.all(5),
    );
  }
}
