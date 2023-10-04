// import 'package:expense_tracker_app/widgets/transaction_list.dart';
// import 'package:expense_tracker_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  // const NewTransaction({super.key});
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    onChanged: (val) {
                      // titleInput=val;
                    },
                    controller: titleController,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    onChanged: (val) {
                      // amountInput=val;
                    },
                    keyboardType: TextInputType.number,
                    controller: amountController,
                  ),
                  TextButton(
                      onPressed: () {
                        addTx(titleController.text, double.parse(amountController.text));
                        // print(amountInput);
                        // print(titleInput);
                      },
                      child:const Text('Add Transaction'))
                ],
              ),
            )),
        // TransactionList(transactions)
      ],
    );
  }
}
