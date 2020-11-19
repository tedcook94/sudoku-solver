import 'package:flutter/material.dart';

class KeyCell extends StatelessWidget {
  final int number;

  // Constructor
  KeyCell({this.number});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 /1,
      child: RaisedButton(
        child: Text(
          this.number == 0 ? 'X' : this.number.toString(),
          style: TextStyle(
            fontSize: 40.0
          ),
        ),
        onPressed: () {
          print('Pressed the ' + this.number.toString() + ' key');
        },
      )
    );
  }
}