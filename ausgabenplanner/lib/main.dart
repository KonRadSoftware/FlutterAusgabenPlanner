import 'package:ausgabenplanner/widgets/new_transactions.dart';
import 'package:ausgabenplanner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ausgaben App',
      theme: ThemeData(
        primarySwatch: Colors.purple, 
        accentColor: Colors.lime,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold, 
            fontSize: 16),),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: "OpenSans", 
            fontSize: 28),),),
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
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "t1",
      title: "Bananen",
      amount: 12.35,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Schuhe mit Schnalle",
      amount: 49.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmound) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmound,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

void startAddNewTransaction(BuildContext ctx){
  showModalBottomSheet(context: ctx, builder: (_){
return GestureDetector(child: NewTransaction(_addNewTransaction),behavior: HitTestBehavior.opaque,);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ausgaben App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () => startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text("CHART"),
                elevation: 5,
                color: Colors.blueAccent,
              ),
              width: double.infinity,
            ),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () => startAddNewTransaction(context), child: Icon(Icons.add_circle_outline)),
    );
  }
}
