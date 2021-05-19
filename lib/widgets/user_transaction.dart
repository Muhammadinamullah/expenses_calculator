import './new_transaction.dart';
import 'package:flutter/material.dart';
import './transaction_list.dart';

class UserTranaction extends StatefulWidget {
  @override
  _UserTranactionState createState() => _UserTranactionState();
}

class _UserTranactionState extends State<UserTranaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(),
      ],
    );
  }
}
