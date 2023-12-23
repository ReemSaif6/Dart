import 'dart:io';

void main() {
  while (true) {
    playGame();
    stdout.write('Do you want to play again? (y/n): ');
    if (stdin.readLineSync()?.toLowerCase() != 'y') {
      break;
    }
  }
  print('Thanks for playing! GoodBye.');
}

void playGame() {
  var board = List.generate(9, (index) => (index + 1).toString());
  var currentPlayer = 'X';

  while (true) {
    displayBoard(board);

    var move = getPlayerMove(board, currentPlayer);
    board[move] = currentPlayer;

    if (checkForWin(board, currentPlayer)) {
      displayBoard(board);
      print('$currentPlayer wins!');
      break;
    }

    if (!board.any((element) => element == (board.indexOf(element) + 1).toString())) {
      displayBoard(board);
      print('It\'s a draw!');
      break;
    }

    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
}

void displayBoard(List<String> board) {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('-----------');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('-----------');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

int getPlayerMove(List<String> board, String currentPlayer) {
  while (true) {
    stdout.write('$currentPlayer\'s turn (1-9): ');
    var input = stdin.readLineSync();
    if (input != null && input.length == 1 && int.tryParse(input) != null && 1 <= int.parse(input) && int.parse(input) <= 9) {
      var move = int.parse(input) - 1;
      if (board[move] != 'X' && board[move] != 'O') {
        return move;
      }
    }
    print('Invalid move. Please try again.');
  }
}

bool checkForWin(List<String> board, String player) {
  // Check rows
  for (var i = 0; i < 9; i += 3) {
    if (board[i] == player && board[i + 1] == player && board[i + 2] == player) {
      return true;
    }
  }
  // Check columns
  for (var i = 0; i < 3; i++) {
    if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
      return true;
    }
  }
  // Check diagonals
  if ((board[0] == player && board[4] == player && board[8] == player) ||
      (board[2] == player && board[4] == player && board[6] == player)) {
    return true;
  }
  return false;
}


