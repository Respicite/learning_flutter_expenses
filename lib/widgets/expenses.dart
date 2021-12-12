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

  @override
  Widget build(BuildContext context) {

    titleController = widget.titleController;
    amountController = widget.amountController;
    transactions = widget.transactions;
    
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ExpenseChart(transactions: transactions,),
        ExpenseList(transactions: transactions, removeTransaction: widget.removeTransaction),
      ]
    );
  }
}
