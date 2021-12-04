import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  final Function addTx;

  final TextEditingController titleController;
  final TextEditingController amountController;

  const NewExpense({ this.titleController, this.amountController, this.addTx});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              FlatButton(onPressed: () => {
                addTx(titleController.text, double.parse(amountController.text))
              }, child: Text('Add Expense', style: TextStyle(color: Colors.blue),),)
            ],
          ),
        )
    );
  }
}
