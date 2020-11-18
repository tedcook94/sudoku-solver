import 'dart:math';

class Sudoku {
  List<List<int>> sudoku = [
    [0, 4, 0, 0, 0, 0, 6, 2, 0],
    [1, 0, 2, 8, 6, 7, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 2, 0, 8, 9],
    [0, 0, 0, 7, 8, 0, 0, 0, 3],
    [0, 3, 0, 0, 0, 5, 7, 0, 0],
    [6, 0, 0, 2, 4, 3, 0, 0, 0],
    [4, 0, 0, 1, 0, 0, 2, 0, 0],
    [5, 0, 3, 6, 0, 0, 1, 0, 0]
  ];

  Sudoku() {
    this._printSudoku();
  }

  void solve() {
    var start = DateTime.now();

    bool success = this._attemptSolution();

    print("Sudoku " + (success ? "has been solved!" : "could not be completed."));
    print("Duration: " + DateTime.now().difference(start).inMilliseconds.toString() + " ms");
    print("");
    this._printSudoku();
  }

  void _printSudoku() {
    this.sudoku.forEach((row) {
      String rowConcat = "";
      row.forEach((cell) {
        rowConcat += cell.toString() + " ";
      });
      print(rowConcat);
    });
  }

  bool _attemptSolution() {
    // Finds next empty cell and tries to find a valid value for it
    // If a potentially valid value is found, recursively call the function again for the next cell
    // When a cell is found with no potential solutions, unwind until you find a previous cell that
    // has another potential value
    // If no previous cell contains any more valid values, then the sudoku is invalid
    // If we reach the end with each cell having a valid value, then the sudoku is solved
    for (var i = 0; i < pow(this.sudoku.length, 2); i++) {
      int rowIndex = i ~/ this.sudoku.length;
      int colIndex = i % this.sudoku.length;
      int curCell = this.sudoku[rowIndex][colIndex];

      // If current cell is a 0, try to find a valid value for it
      if (curCell == 0) {
        // Get current row and column as lists
        List<int> row = this.sudoku[rowIndex];
        List<int> col = this.sudoku.map((row) => row[colIndex]).toList();

        // Get current square as a list of values by finding the appropriate row and column ranges
        // and flattening into a single list
        int squareSize = sqrt(this.sudoku.length).round();
        List<int> square = this
            .sudoku
            .getRange(
                rowIndex - (rowIndex % squareSize), ((rowIndex ~/ squareSize) + 1) * squareSize)
            .map((row) => row.getRange(
                colIndex - (colIndex % squareSize), ((colIndex ~/ squareSize) + 1) * squareSize))
            .expand((cell) => cell)
            .toList();

        for (var x = 1; x <= this.sudoku.length; x++) {
          // Make sure potential value isn't already in current row
          if (!row.contains(x)) {
            // Make sure potential value isn't already in current column
            if (!col.contains(x)) {
              // Make sure potential value isn't already in current square
              if (!square.contains(x)) {
                // Set current cell's value since we haven't found any conflicts
                this.sudoku[rowIndex][colIndex] = x;

                // Check if we've finished solving
                if (this._isComplete())
                  return true;
                // If we get true back from our child call, then we've found a solution somewhere
                // and we bubble it up the recursion chain
                else if (this._attemptSolution())
                  return true;
                // If we get false back, then some cell ran out of options and we need to backtrack
                // Set the current cell back to 0 so we can try the next possible value for this cell
                else
                  this.sudoku[rowIndex][colIndex] = 0;
              }
            }
          }
        }

        // If we get here, we went through all possible values for this cell without finding a valid
        // option, so we return false to indicate that we need to backtrack
        print("Backtracking from row " + rowIndex.toString() + ", col " + colIndex.toString());
        return false;
      }
    }

    // We should never reach here, because if we reach the last cell we've found the solution
    // This is here to prevent the compiler from complaining about a potential for no return value
    return false;
  }

  bool _isComplete() {
    // Returns whether or not the sudoku has been completed
    return !this.sudoku.any((row) => row.any((cell) => cell == 0));
  }
}
