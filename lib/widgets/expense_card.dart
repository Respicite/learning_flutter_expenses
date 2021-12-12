import 'package:flutter/material.dart';

import '../models/transaction.dart';

class ExpenseCard extends StatelessWidget {
  final Transaction expense;
  final Function removeTransaction;

  ExpenseCard(this.expense, this.removeTransaction);

  void trash() {
    removeTransaction(expense.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: trash,),
          leading: CircleAvatar(
            radius: 25,
            child: Padding(padding: const EdgeInsets.all(5),
              child: FittedBox(child: Text(expense.readableAmount, style: TextStyle(color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold, fontSize: 25),)))
          ),
          title: Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          subtitle: Text(expense.readableDate, style: const TextStyle(fontSize: 15, color: Colors.grey),),
        ),
      ),
    );

    // Old way of doing it - a little bit more work compared to ListTile
    // return Card(
    //   margin: EdgeInsets.all(5),
    //   child: Container(
    //     margin: EdgeInsets.all(25),
    //     child: Row(
    //       children: [
    //         Flexible(
    //           fit: FlexFit.tight,
    //           child: Container(
    //             padding: EdgeInsets.all(10),
    //             decoration: BoxDecoration(
    //               border: Border.all(
    //                 color: Theme.of(context).accentColor,
    //                 width: 2
    //               )
    //             ),
    //             child: FittedBox(child: Text(expense.readableAmount, style: TextStyle(color: Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold, fontSize: 25),)),
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(left: 30),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.only(bottom: 10),
    //                 child: FittedBox(child: Text(expense.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
    //               ),
    //               Text(expense.readableDate, style: TextStyle(fontSize: 15, color: Colors.grey),),
    //             ],
    //           ),
    //         )
    //       ],
    //     )
    //   ),
    // );
  }
}
