import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial_expenses/widgets/expenses.dart';
import 'package:flutter_tutorial_expenses/widgets/new_expense.dart';

import 'dart:io';

import 'models/transaction.dart';

void main() {
  // Only allows Potrait Mode Orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // if you want to true Cuppertino (Apple / iOS) experience you should switch
    // Material App for CupertinoApp which then also includes Page transitions
    // and other apple things (via Platform.isiOS)
    return MaterialApp(
      title: 'Expenses',
      home: MyHomePage(),
      //there are apperently some issues with ThemeDate on CupertinoApps in which
      // case you should direct styles where needed
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  List<Transaction> transactions = [
    // Transaction(id: '1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    // Transaction(id: '2', title: 'Food', amount: 37.15, date: DateTime.now()),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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

  Widget buildAndroidScaffold(BuildContext context){
    // One might want to put body into an SafeArea Widget to prevent it from intruding
    // on the status bar / bottom gesture bar but it seems that is most ofentn not
    // needed (except sth is scrollable)

    //Scaffold automatically gives Material (Android) Standard Design Template
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker', style: Theme.of(context).textTheme.caption,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => { openNexEpenseModal(context) }, icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(child: Expenses(titleController: titleController, amountController: amountController, transactions: transactions, removeTransaction: removeTransaction)),
      //Differentiate between different Platforms
      floatingActionButton: Platform.isAndroid ? FloatingActionButton(child: Icon(Icons.add), onPressed: () => { openNexEpenseModal(context) },) : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildAppleScaffold(BuildContext context){
    // CupertinoPageScaffold is Standard Cupertino (Apple) styles
    // child of CPS is the same as body in Scaffold
    return CupertinoPageScaffold(
      // Something here seems to be not working correctly
      // if needed check lesson no 134 again
      child: Container(margin: EdgeInsets.all(50),child: Container( color: Colors.red,child:CupertinoTextField(cursorHeight: 50, placeholder: 'This is a placehiolder',))),
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(previousPageTitle: 'Home', onPressed: () {},),
        // Example how to build own Buttons etc
        trailing: GestureDetector(
            onTap: () {},
            child: Icon(CupertinoIcons.add)
        ),
        // if multiple leading / trailling widgets are needed they can push the
        // other objects out of their visible space, to fix this:
        // Row(mainAxisSize: MainAxisSize.min) so it only takes as much space as
        // it actually needs (can be set dynamically and screen % with MediaQuery)
        middle: Text('Title'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? buildAndroidScaffold(context)
        : buildAppleScaffold(context)
    ;
  }
}
