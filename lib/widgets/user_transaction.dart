import './new_transaction.dart';
import 'package:flutter/material.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTranaction extends StatefulWidget {
  @override
  _UserTranactionState createState() => _UserTranactionState();
}

class _UserTranactionState extends State<UserTranaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 'trans1', title: 'Eggs', amount: 120.0, date: DateTime.now()),
    Transaction(
        id: 'trans2', title: 'New dress', amount: 90.0, date: DateTime.now())
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
