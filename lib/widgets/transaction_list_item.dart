import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: FittedBox(
                  child: Text('\$${transaction.amount}')),
            )),
        title: Text(
          transaction.title,
          style: Theme
              .of(context)
              .textTheme
              .title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery
            .of(context)
            .size
            .width > 360
            ? FlatButton.icon(
            icon: Icon(Icons.delete),
            textColor: Colors.grey,
            label: Text("Delete"),
            onPressed: () => deleteTx(transaction.id))
            : IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => deleteTx(transaction.id)),
      ),
    );
  }}