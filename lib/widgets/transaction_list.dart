import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_expenses/widgets/transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text('There are no transactions yet',
                    style: Theme.of(context).textTheme.title),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            );
    });
  }
}


