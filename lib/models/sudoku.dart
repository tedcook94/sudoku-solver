import 'dart:math';

class Sudoku {
  List<List<_Cell>> sudoku = [
    [
      new _Cell(provided: false),
      new _Cell(provided: true, number: 6),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 4),
      new _Cell(provided: false),
      new _Cell(provided: false)
    ],
    [
      new _Cell(provided: false),
      new _Cell(provided: true, number: 1),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 5),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 9),
      new _Cell(provided: false)
    ],
    [
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 9),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 7),
      new _Cell(provided: true, number: 4),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false)
    ],
    [
      new _Cell(provided: true, number: 3),
      new _Cell(provided: true, number: 9),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 6),
      new _Cell(provided: true, number: 1),
      new _Cell(provided: true, number: 7)
    ],
    [
      new _Cell(provided: true, number: 4),
      new _Cell(provided: true, number: 8),
      new _Cell(provided: true, number: 7),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 6),
      new _Cell(provided: true, number: 1),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 9)
    ],
    [
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 9),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false)
    ],
    [
      new _Cell(provided: false),
      new _Cell(provided: true, number: 4),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 5),
      new _Cell(provided: true, number: 1),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 3),
      new _Cell(provided: false)
    ],
    [
      new _Cell(provided: true, number: 6),
      new _Cell(provided: true, number: 7),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 9),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 2),
      new _Cell(provided: false)
    ],
    [
      new _Cell(provided: false),
      new _Cell(provided: true, number: 3),
      new _Cell(provided: true, number: 1),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 2),
      new _Cell(provided: true, number: 8),
      new _Cell(provided: false),
      new _Cell(provided: true, number: 4),
      new _Cell(provided: false)
    ]
  ];

  Sudoku() {
    this.sudoku.forEach((row) {
      String rowConcat = "";
      row.forEach((cell) {
        rowConcat += cell.number.toString() + " ";
      });
      print(rowConcat);
    });
  }

  void solve() {
    if (this._isValid())
      print("Sudoku is valid!");
    else
      print("Sudoku is not valid.");
  }


  bool _isValid() {
    // Returns whether or not the sudoku is valid based on current numbers

    for (var i = 0; i < this.sudoku.length; i++) {
      List<_Cell> row = this.sudoku[i];

      for (var j = 0; j < row.length; j++) {
        if (row[j].number == 0) continue;

        _Cell cell = row[j];
        List<_Cell> col = this.sudoku.map((row2) => row2[j]).toList();
        int blockSize = sqrt(this.sudoku.length).round();

        // See if cell in same row has same number
        // Only have to look to the right since we're going in order
        if (-1 != row.indexWhere((cell2) => cell.number == cell2.number, j + 1))
          return false;
        // See if cell in same column has same number
        // Only have to look down since we're going in order
        if (-1 != col.indexWhere((cell2) => cell.number == cell2.number, i + 1))
          return false;
        // See if cell in same block has same number
        // Only have to look right and down since we're going in order
        for (int x = i; (x ~/ blockSize) == (i ~/ blockSize); x++) {
          for (int y = j; (y ~/ blockSize) == (j ~/ blockSize); y++) {
            if ((x != i || y != j) && this.sudoku[x][y].number == cell.number)
              return false;
          }
        }
      }
    }

    // If we never find a match, then it must be valid
    return true;
  }
}

class _Cell {
  int number;
  bool provided;

  _Cell({this.number, this.provided}) {
    if (!this.provided && this.number == null) this.number = 0;
  }
}
