import 'package:flutter/material.dart';
import 'package:flutter_tutorial_expenses/widgets/expenseList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(child: Container(width: double.infinity, color: Colors.deepOrange, child: Text('Charts')), elevation: 5,),
          ExpenseList(),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                  ),
                  FlatButton(onPressed: () => { print('${titleController.text}: ${amountController.text}€') }, child: Text('Add Expense', style: TextStyle(color: Colors.blue),),)
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
