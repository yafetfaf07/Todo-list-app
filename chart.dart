import 'package:expense_tracker_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {super.key});
  final List<Transaction> recentTransactions;
  List<Object>get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      var totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (DateTime.parse(recentTransactions[i].date).day == weekDay.day &&
            DateTime.parse(recentTransactions[i].date).month == weekDay.month &&
            DateTime.parse(recentTransactions[i].date).year == weekDay.year) {
          totalSum += recentTransactions[i].price;
        }
      }
    
       return {"day":DateFormat.E().format(weekDay), 'total':totalSum } ;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return  Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: (groupedTransactionValues).map( (data) {
            return Text(data.toString());
          }).toList()
        ));
  }
}
