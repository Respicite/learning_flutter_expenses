import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final Function addTx;

  final TextEditingController titleController;
  final TextEditingController amountController;

  const NewExpense({ this.titleController, this.amountController, this.addTx});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  DateTime date;

  void submitExpense() {
    if(date==null || widget.titleController.text==null || widget.amountController.text ==null){ return; }

    var title = widget.titleController.text;
    var amount = double.parse(widget.amountController.text);

    if(amount <= 0 ) { return; }

    widget.addTx(title, amount, date);
  }

  void presentDatePicker(BuildContext ctx) {
    showDatePicker(
        context: ctx,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()
    ).then((pickedDate) {
      if(pickedDate==null){ return; }
      setState(() {
        date = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: widget.titleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: widget.amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_val) => submitExpense(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Text(date==null ? 'No Date Chosen!' : DateFormat('EEEE d.MMMM yyyy').format(date))),
                    FlatButton(
                        child: Text('Choose Date', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),),
                        onPressed: () { presentDatePicker(context); })
                  ],
                ),
              ),
              RaisedButton(onPressed: submitExpense, child: Text('Add Expense'), color: Theme.of(context).primaryColor,)
            ],
          ),
        )
    );
  }
}
