import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTransaction,
  });

  final List<Transaction> transactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: transactions.isEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  Text("No transactions added yet!",
                      style: TextStyle(
                          fontFamily: "OpenSans", fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'),
                  ),
                ],
              ))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: FittedBox(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyanAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "\$${transactions[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                        icon: Icon(
                          Icons.delete_outline_sharp,
                          color: Theme.of(context).colorScheme.error,
                          size: 30,
                        )),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
