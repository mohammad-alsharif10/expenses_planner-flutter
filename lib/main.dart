import 'package:flutter/material.dart';
import 'package:planner/widgets/transaction-form.dart';
import 'package:planner/widgets/transactions-list.dart';

import 'model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  void addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        title: title,
        date: DateTime.now());
    setState(() => transactions.add(newTransaction));
  }

  void startNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (context) {
          return TransactionFormWidget(addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Expenses planner')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => startNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TransactionsListWidget(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startNewTransaction(context),
      ),
    );
  }
}
