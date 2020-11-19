import 'package:flutter/material.dart';

import 'package:sudoku_solver/widgets/key-cell.dart';

class KeyTable extends StatelessWidget {
  final int rows, cols;

  // Constructor
  KeyTable({this.rows, this.cols});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(),
      children: List.generate(this.rows, (int rowIndex) {
        return TableRow(
          children: List.generate(this.cols, (int colIndex) {
            int keyNumber = (this.cols * rowIndex) + colIndex + 1;

            return Padding(
              padding: EdgeInsets.all(5.0),
              child: KeyCell(number: keyNumber == this.rows * this.cols ? 0 : keyNumber),
            );
          }),
        );
      }),
    );
  }
}