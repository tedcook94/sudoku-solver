import 'package:flutter/material.dart';

import 'package:sudoku_solver/models/sudoku.dart';

import 'package:sudoku_solver/widgets/sudoku-table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku Solver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final Sudoku sudoku = new Sudoku();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Sudoku Solver',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
            flex: 6,
            child: Padding(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                child: SudokuTable(
                  tableSize: 9,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: RaisedButton(
              onPressed: sudoku.solve,
              child: Text('Solve Sudoku'),
            ),
          ),
        ]),
      ),
    );
  }
}
