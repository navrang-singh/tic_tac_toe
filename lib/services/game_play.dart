class GameCore {
  static const int boardLen = 9;

  List<String> boardConfig = [];

  static List<String> initState() {
    return List.generate(boardLen, (index) => "");
  }

  bool gameState(int idx, String player, List<int> board) {
    int c = idx % 3;
    int r = idx ~/ 3;
    int gridSize = 3;
    int score = player == "X" ? 1 : -1;

    board[r] += score;
    board[gridSize + c] += score;

    if (r == c) board[2 * gridSize] += score;
    if (gridSize - 1 - c == r) board[2 * gridSize + 1] += score;
    if (board.contains(3) || board.contains(-3)) {
      return true;
    }

    return false;
  }
}
