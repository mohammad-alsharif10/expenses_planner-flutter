import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:planner/model/transaction.dart';

class TransactionsListWidget extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsListWidget(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '${transactions[index].amount.toStringAsFixed(2)} \$',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    Text(
                      DateFormat()
                          .add_yMMMMd()
                          .format(transactions[index].date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
