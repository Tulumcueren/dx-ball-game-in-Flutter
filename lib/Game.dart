import 'package:antiyoy/gameEnemy.dart';
import 'package:flutter/material.dart';
import 'Player.dart';
import 'Kutu.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

//X Ve Y bulcagiz
class _GameState extends State<Game> {
  double movmentX = 10;
  double movmentY = 10;
  gamePlayer player = gamePlayer(
      positionX: 5,
      positionY: 23,
      gamesizeX: 13,
      gamesizeY: 25,
      playerWidth: 1);
  Enemy gameLevel1 = Enemy(levelX: 13, levelY: 25);

  Column _provA() {
    gameLevel1.EnemyGenerator();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Space(space: 20),
        for (int y = 0; y < player.gamesizeY; y++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int x = 0; x < player.gamesizeX; x++)
                player.playerPositioninMap(x, y)
                    ? Kutu(
                        status: Colors.blueAccent,
                        ball: false,
                      )
                    : (player.gamesizeX / 2).toInt() == x &&
                            y == (player.gamesizeY / 2).toInt()
                        ? Kutu(status: Colors.amber, ball: true)
                        : Kutu(
                            status: gameLevel1.EnemyFinder(x, y)
                                ? Colors.blueGrey.shade400
                                : Colors.amber,
                            ball: false,
                          )
            ],
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // x1 x2 x3 y1 y2 y3
      children: [
        _provA(),
        Space(space: 20),
        Controllers(),
      ],
    );
  }

  Column Controllers() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*     buttonManagement(
          () => player.movementUpY(),
        ), */
        Space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttonManagement(() => player.movementLeftX(),
                buttonTextValue: "Left"),
            buttonManagement(() => player.movementRightX(),
                buttonTextValue: "Right"),
          ],
        ),
        /*      Space(),
        buttonManagement(() => player.movementDownY(), buttonTextValue: "Down"), */
      ],
    );
  }

  Container Space({double space = 10}) {
    return Container(
      width: space,
      height: space,
    );
  }

  ElevatedButton buttonManagement(double Function() doIT,
      {String buttonTextValue = "Up"}) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            doIT();
          });
        },
        child: Text(buttonTextValue));
  }
}
