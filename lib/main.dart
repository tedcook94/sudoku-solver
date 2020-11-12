import 'package:flutter/material.dart';
import 'models/sudoku.dart';

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
        title: Text('Sudoku Solver'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: sudoku.solve,
          child: Text('Solve Sudoku'),
        ),
      ),
    );
  }
}
