import 'dart:io';

void main() {
  print('Welcome to Tic Tac Toe!');
  
  List<String> board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  String currentPlayer = 'X';
  
  while (true) {
    printBoard(board);
    
    print('Player $currentPlayer, enter a number (1-9):');
    String? input = stdin.readLineSync();
    int? move = int.tryParse(input ?? '');
    
    if (move == null || move < 1 || move > 9 || board[move-1] != move.toString()) {
      print('Invalid move. Try again.');
      continue;
    }
    
    board[move-1] = currentPlayer;
    
    if (checkWinner(board, currentPlayer)) {
      printBoard(board);
      print('Player $currentPlayer wins!');
      break;
    }
    
    if (board.every((cell) => cell == 'X' || cell == 'O')) {
      printBoard(board);
      print('It\'s a tie!');
      break;
    }
    
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
}

void printBoard(List<String> board) {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('---+---+---');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('---+---+---');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

bool checkWinner(List<String> board, String player) {
  for (int i = 0; i < 9; i += 3) {
    if (board[i] == player && board[i+1] == player && board[i+2] == player) {
      return true;
    }
  }
  
  for (int i = 0; i < 3; i++) {
    if (board[i] == player && board[i+3] == player && board[i+6] == player) {
      return true;
    }
  }
  
  if (board[0] == player && board[4] == player && board[8] == player) {
    return true;
  }
  if (board[2] == player && board[4] == player && board[6] == player) {
    return true;
  }
  
  return false;
}
