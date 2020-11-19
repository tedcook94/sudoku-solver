import 'dart:math';

import 'package:flutter/material.dart';

class SudokuCell extends StatelessWidget {
  final int row, col;

  final Color borderColor = new Random().nextInt(2) == 0
      ? Colors.transparent
      : (new Random().nextInt(2) == 0 ? Colors.green[400] : Colors.red[400]);

  // Constructor
  SudokuCell({this.row, this.col});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
        enableFeedback: true,
        onTap: () {
          print('Tapped cell in row ' + this.row.toString() + ', col ' + this.col.toString());
        },
        child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(
                    color: borderColor,
                    width: 4.0,
                  ))),
                  child: Center(
                      child: Text(
                    (row + 1).toString(),
                    style: TextStyle(fontSize: 22, color: Colors.grey[800]),
                  ))),
            )));
  }
}
