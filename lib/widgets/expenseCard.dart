import 'package:flutter/material.dart';

import '../models/transaction.dart';

class ExpenseCard extends StatelessWidget {
  final Transaction expense;

  ExpenseCard(this.expense);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.all(25),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                  width: 2
                )
              ),
              child: Text('${expense.amount}€', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(expense.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Text(expense.readableDate, style: TextStyle(fontSize: 15, color: Colors.grey),),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
