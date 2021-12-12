import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/widgets/expenses.dart';
import 'package:flutter_tutorial_expenses/widgets/new_expense.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          caption: TextStyle( fontSize: 25)),
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  List<Transaction> transactions = [
    // Transaction(id: '1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    // Transaction(id: '2', title: 'Food', amount: 37.15, date: DateTime.now()),
  ];

  void addNewTransaction(String title, double amount, DateTime date){
    final newTransaction = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: date);

    setState(() {
      titleController.text = '';
      amountController.text = '';
      transactions.add(newTransaction);
      Navigator.of(context).pop();
    });
  }

  void removeTransaction(String id) {
    setState(() {
      transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void openNexEpenseModal(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bCtx) {
      return NewExpense(titleController: titleController, amountController: amountController, addTx: addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker', style: Theme.of(context).textTheme.caption,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => { openNexEpenseModal(context) }, icon: Icon(Icons.add))
        ],
      ),
      body: Expenses(titleController: titleController, amountController: amountController, transactions: transactions, removeTransaction: removeTransaction),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => { openNexEpenseModal(context) },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
