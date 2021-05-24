import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    //widget.addTx(titleController.text, double.parse(amountController.text));

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    //when add the transaction the bottom sheet will close automatically
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,

              //onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Choosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          onPressed: _presentDatePicker,
                          child: Text('Date Choose',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      : TextButton(
                          onPressed: _presentDatePicker,
                          child: Text('Date Choose',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add',
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,

              // style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     color: Theme.of(context).textTheme.button.color),

              onPressed: submitData,

              //Color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
