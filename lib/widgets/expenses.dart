import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/models/transaction.dart';
import 'package:flutter_tutorial_expenses/widgets/expense_chart.dart';

import 'expense_list.dart';
import 'package:flutter_tutorial_expenses/widgets/expense_list.dart';


class Expenses extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final List<Transaction> transactions;
  final Function removeTransaction;

  const Expenses({this.titleController, this.amountController, this.transactions, this.removeTransaction});

  @override
  _Expenses createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  TextEditingController titleController;
  TextEditingController amountController;
  List<Transaction> transactions;

  bool showChart = false;

  void toggleChart(a){
    setState(() {
      showChart == false ? showChart = true : showChart = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    bool portrait = MediaQuery.of(context).orientation == Orientation.portrait;

    titleController = widget.titleController;
    amountController = widget.amountController;
    transactions = widget.transactions;
    
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        portrait ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Switch(value: showChart, onChanged: (a) {toggleChart(a);}),
            // Switch.adaptive uses platform matching styles on widgets where it
            // is available
            Switch.adaptive(value: showChart, onChanged: (a) {toggleChart(a);}),
            Text('Toggle Chart Visibility')
          ],
        ) : SizedBox(height: 10,),
        showChart && portrait ? ExpenseChart(transactions: transactions,) : Container(),
        ExpenseList(transactions: transactions, removeTransaction: widget.removeTransaction),
      ]
    );
  }
}
