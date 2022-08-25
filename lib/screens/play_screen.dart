import 'package:flutter/material.dart';
import 'package:tic_tac_toe/services/game_play.dart';
import 'package:tic_tac_toe/services/service.dart';
import 'package:tic_tac_toe/widgets/widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Players players;
  // ignore: prefer_typing_uninitialized_variables
  var argv;
  var value = {};

  List<int> board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  bool flag = false;
  late String lastPlayed;
  int turn = 0;

  GameCore game = GameCore();

  @override
  void initState() {
    super.initState();
    game.boardConfig = GameCore.initState();
  }

  // ignore: prefer_typing_uninitialized_variables
  var size;
  String res = "";
  bool abcd = true;
  @override
  Widget build(BuildContext context) {
    argv = ModalRoute.of(context)!.settings.arguments;
    String a = argv['player1'];
    String b = argv['player2'];

    players = Players(firstPlayer: a, secondPlayer: b);
    value = players.getSign();

    size = MediaQuery.of(context).size;
    if (abcd == true) {
      lastPlayed = players.firstPlayer;
      abcd = false;
    }

    return Scaffold(
      body: Center(
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              // ignore: prefer_const_literals_to_create_immutables
              shadows: [
                const Shadow(
                  blurRadius: 50,
                  color: Colors.blueAccent,
                ),
              ],
              text: "$lastPlayed turn ",
              fontSize: 30,
            ),
            Container(
              height: size.height * 0.5,
              width: double.maxFinite,
              padding: const EdgeInsets.all(5),
              child: GridView.count(
                crossAxisCount: GameCore.boardLen ~/ 3,
                padding: const EdgeInsets.all(15),
                children: List.generate(
                  GameCore.boardLen,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: !flag
                            ? () {
                                if (game.boardConfig[index] == "") {
                                  setState(
                                    () {
                                      game.boardConfig[index] =
                                          value[lastPlayed];
                                      turn += 1;
                                      flag = game.gameState(
                                          index, value[lastPlayed], board);

                                      if (flag) {
                                        res = "$lastPlayed has won the Game !!";
                                      } else if (!flag && turn == 9) {
                                        res = "Draw!";
                                        flag = true;
                                      }

                                      if (lastPlayed == players.firstPlayer) {
                                        lastPlayed = players.secondPlayer;
                                        print('changed 1 -> 2');
                                      } else {
                                        lastPlayed = players.firstPlayer;
                                        print("changed 2 -> 1");
                                      }
                                    },
                                  );
                                }
                              }
                            : () => {},
                        child: Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            shadows: const [
                              Shadow(
                                blurRadius: 50,
                                color: Colors.blueAccent,
                              )
                            ],
                            text: game.boardConfig[index],
                            fontSize: 50,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              shadows: const [
                Shadow(
                  blurRadius: 50,
                  color: Colors.blueAccent,
                )
              ],
              text: res,
              fontSize: 20,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              onPressed: () {
                setState(() {
                  game.boardConfig = GameCore.initState();
                  lastPlayed = players.firstPlayer;
                  flag = false;
                  turn = 0;
                  res = "";
                  board = [0, 0, 0, 0, 0, 0, 0, 0, 0];
                });
              },
              btnText: "Reset the Game",
            )
          ],
        ),
      ),
    );
  }
}
