import 'package:ausgabenplanner/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "Bananen",
      amount: 5.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Schuhe",
      amount: 49.90,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
              children: transactions.map((tx) {
            return Card(
              child: Text(tx.title),
            );
          }).toList()),
        ],
      ),
    );
  }
}
