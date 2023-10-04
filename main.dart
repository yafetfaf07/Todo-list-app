import 'package:expense_tracker_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Todo-app'),
          ),
          body:  SingleChildScrollView(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 UserTransaction(),
              ],
            ),
          )),
    );
  }
}
