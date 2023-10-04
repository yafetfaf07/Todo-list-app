import 'package:expense_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
   TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("There are no transactions left!!"),
                Image.asset('assets/images/transactions.png')
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    elevation: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.blue)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${transactions[index].price}\$",
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                )),
                            Column(
                              children: [
                                Text(transactions[index].expenseName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Text(transactions[index].date,
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed:() {deleteTransaction(transactions[index].expenseName);},
                            child: Icon(Icons.delete, color:Colors.red),
                           )
                      ],
                    ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
