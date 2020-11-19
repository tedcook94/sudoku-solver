import 'dart:math';
import 'package:flutter/material.dart';

import 'package:sudoku_solver/widgets/sudoku-cell.dart';

class SudokuTable extends StatelessWidget {
  final int tableSize;

  final BorderSide staticBS = BorderSide.none;

  BorderSide variableBS(index) {
    double borderWidth = (index + 1 == tableSize)
        ? 0.0
        : ((index + 1) % sqrt(tableSize).round() == 0)
            ? 1.5
            : 0.5;

    return borderWidth == 0.0
        ? BorderSide(style: BorderStyle.none)
        : BorderSide(width: borderWidth, color: Colors.grey[600]);
  }

  // Constructor
  SudokuTable({this.tableSize});

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: List.generate(tableSize, (int rowIndex) {
          return TableRow(
              decoration: BoxDecoration(border: Border(bottom: variableBS(rowIndex))),
              children: List.generate(tableSize, (int colIndex) {
                return Container(
                  decoration: BoxDecoration(border: Border(right: variableBS(colIndex))),
                  child: SudokuCell(row: rowIndex, col: colIndex),
                );
              }));
        }));
  }
}
