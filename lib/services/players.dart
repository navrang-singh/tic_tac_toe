class Players {
  String firstPlayer = "";
  String secondPlayer = "";
  String empty = "";
  Players({
    required this.firstPlayer,
    required this.secondPlayer,
  });

  Map<String, String> getSign() {
    var res = {
      firstPlayer: 'X',
      secondPlayer: 'O',
      empty: "",
    };
    return res;
  }
}
