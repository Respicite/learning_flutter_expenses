import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseBar extends StatelessWidget {
  final double amount;
  final double maxAmount;
  final String day;

  ExpenseBar({this.amount, this.maxAmount, this.day});

  @override
  Widget build(BuildContext context) {
    double amountPercentage;

    amount <= 0 || maxAmount <= 0? amountPercentage = 0 : amountPercentage = amount / maxAmount;

    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          Container(height: 20, child: FittedBox(child: Text('${amount.toStringAsFixed(2)}€'))),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: 15,
            height: (50*(1-amountPercentage)),
            color: Theme.of(context).primaryColorLight,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: 15,
            height: (50*amountPercentage)+1,
            color: Theme.of(context).primaryColorDark,
          ),
          // alternatively I could use Stack to *stack* two Containers on top
          // of each other - which would look the same in the final App
          Text(day)
        ],
      ),
    );
  }
}
