import 'package:ausgabenplanner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.userTransaction);

  final List<Transaction> userTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
         itemBuilder: (ctx, index){
return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                padding: EdgeInsets.all(10),
                child: Text(
                  "\$ ${userTransaction[index].amount.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userTransaction[index].title,
                      style: Theme.of(context).textTheme.title,
                      ),
                      
                    
                    Text(
                      DateFormat.yMMMMd().format(userTransaction[index].date),
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ]),
            ],
          ),
        );
         },
         itemCount: userTransaction.length,
          ),
    );
  }
}
