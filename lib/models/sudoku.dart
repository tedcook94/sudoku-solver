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

  // Returns whether or not the sudoku is valid based on the provided numbers
  bool _isValid() {
    // Track current row since any() iterates in order
    int rowIndex = -1;

    // Return opposite of result since we're searching for matches in rows
    // and columns, which would make the sudoku invalid
    return !this.sudoku.any((row) {
      rowIndex++;

      // Track current column
      int columnIndex = -1;

      return row.any((cell) {
        columnIndex++;
        // If cell wasn't provided, then no need to check it
        if (!cell.provided) return false;

        // Check if any cells to the right in the same row have a matching number
        bool rowMatchFound = -1 !=
            row.indexWhere((cellToRight) => cellToRight.number == cell.number,
                columnIndex + 1);

        // Check if any cells below in the same column have a matching number
        bool colMatchFound = -1 !=
            this.sudoku.indexWhere(
                (row2) => row2[columnIndex].number == cell.number,
                rowIndex + 1);

        // Return if match found in either the row or the column
        return rowMatchFound || colMatchFound;
      });
    });
  }
}

class _Cell {
  int number;
  bool provided;

  _Cell({this.number, this.provided}) {
    if (!this.provided && this.number == null) this.number = 0;
  }
}
