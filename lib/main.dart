import './models/transaction.dart';

import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans",
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          primary: Colors.cyan,
          secondary: Colors.amber,
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(appTitle: 'Personal Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.appTitle});
  final String appTitle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: selectedDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransactions(addTx: _addNewTransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Text(widget.appTitle),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              // color: Theme.of(context).primaryColor,
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Chart(recentTransactions: _recentTransactions),
            ),
          ),
          TransactionList(
            transactions: _userTransactions,
            deleteTransaction: _deleteTransaction,
          ),
        ],
      ),
    );
  }
}
