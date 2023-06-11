import 'dart:async';

import 'package:antiyoy/Ball.dart';
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
  Enemy gameLevel1 = Enemy(levelX: 13, levelY: 10);
  Ball gameBall = Ball(ballPositionX: 6, ballPositionY: 12);

  Column _provA() {
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
                    : gameBall.centerBall(x, y)
                        ? Kutu(status: Colors.amber, ball: true)
                        : Kutu(
                            status: gameLevel1.EnemyFinder(x, y)
                                ? (Colors.blueGrey.shade400)
                                : Colors.amber,
                            ball: false,
                          )
            ],
          )
      ],
    );
  }

  @override
  void initState() {
    gameLevel1.EnemyGenerator();
    gameBall.getINEnemys(gameLevel1.EnemyMap);
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        /*  gameBall.upping == false
            ? gameBall.ballPositionY += 1
            : gameBall.upping == true
                ? gameBall.ballPositionY -= 1
                : gameBall.ballPositionY;
        gameBall.ballPositionY == player.positionY.toInt() - 1
            ? gameBall.upping = true
            : gameBall.upping; */
        gameBall.ballXYMovmentManager(
            1, player.positionY.toInt(), player.positionX.toInt(), 13, 25);

        print(
            "Player Position: X :${player.positionX} Y:${player.positionY}    Ball Position: X:${gameBall.ballPositionX} Y:${gameBall.ballPositionY}");
      });
    });
  }

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
