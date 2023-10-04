import 'package:expense_tracker_app/widgets/new_transaction.dart';
import 'package:expense_tracker_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  void addingNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addTransactions);
        });
  }

  final List<Transaction> transactions = [
    Transaction(
      date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
      expenseName: 'Sneakers',
      price: 100,
    ),
    Transaction(
        date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
        expenseName: 'Banana',
        price: 20)
  ];


  void addTransactions(String title, double amount) {
    final newTx = Transaction(
        date: DateFormat.yMMMMd("en_US").format(DateTime.now()),
        expenseName: title,
        price: amount);
    setState(() {
      if (!(newTx.expenseName == '' || newTx.price == 0.0)) {
        transactions.add(newTx);
        //print(transactions.length);
      }
    });
    Navigator.of(context).pop(); // this closes the ModalBottomSheet
  }

  void deleteTransactions(String expenseName) {
    setState(() {
       transactions.removeWhere((element) {
        return element.expenseName==expenseName;
       });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        TransactionList(transactions, deleteTransactions),
        FloatingActionButton(
          elevation: 30,
            onPressed: () => addingNewTransaction(context),
            child: const Icon(Icons.add))
      ],
    );
  }
}
