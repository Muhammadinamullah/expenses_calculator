import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function hanlder;

  AdaptiveFlatButton(this.hanlder, this.text);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: hanlder,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          )
        : TextButton(
            onPressed: hanlder,
            child: Text('Date Choose',
                style: TextStyle(fontWeight: FontWeight.bold)),
          );
  }
}
