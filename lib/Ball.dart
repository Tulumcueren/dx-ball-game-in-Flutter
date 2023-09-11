import 'package:antiyoy/gameEnemy.dart';

class Ball {
  int ballPositionX = 0;
  int ballPositionY = 0;
  bool upping = false;
  int righting = 0;
  List<EnemysMapping> enemyMapping = [];
  Ball({
    required this.ballPositionX,
    required this.ballPositionY,
  });
  bool centerBall(int x, int y) {
    return ballPositionX == x && ballPositionY == y ? true : false;
  }

  int ballDown() {
    return ballPositionY += 1;
  }

  int ballUp() {
    return ballPositionY -= 1;
  }

  List<EnemysMapping> getINEnemys(List<EnemysMapping> enemyData) {
    return enemyMapping = enemyData;
  }

  void ballXYMovmentManager(int speed, int playerpositionY, int playerpositionX,
      int gamesizeX, int gamesizeY) {
    for (int ze = 0; ze < enemyMapping.length; ze++) {
      enemyMapping[ze].X == ballPositionX &&
              enemyMapping[ze].Y + 1 == ballPositionY
          ? (upping = false, enemyMapping.remove(enemyMapping[ze]))
          : print(enemyMapping[ze]);
    }
    upping == false
        ? ballPositionY += speed
        : upping == true
            ? ballPositionY -= speed
            : 0; //UPPER AND DOWNER
    righting == 1
        ? ballPositionX -= speed
        : righting == 2
            ? ballPositionX += speed
            : 0; //LEFTER AND RIGHTER
    ballPositionX == playerpositionX - 1 &&
                ballPositionY == playerpositionY - 1 ||
            ballPositionX == playerpositionX &&
                ballPositionY == playerpositionY - 1 ||
            ballPositionX == playerpositionX - 2 &&
                ballPositionY == playerpositionY - 1
        ? (righting = 1, upping = true)
        : 0; // LEFT AND UPPING
    ballPositionX == playerpositionX + 1 && ballPositionY == playerpositionY - 1
        ? (upping = true, righting = 0)
        : 0; // ONLY UPPING
    ballPositionX == playerpositionX + 2 &&
                ballPositionY == playerpositionY - 1 ||
            ballPositionX == playerpositionX + 3 &&
                ballPositionY == playerpositionY - 1 ||
            ballPositionX == playerpositionX + 4 &&
                ballPositionY == playerpositionY
        ? (righting = 2, upping = true)
        : 0; //RIGHT AND UPPING
    ballPositionX == 0
        ? righting = 2 //On Touch left turn right
        : ballPositionX == gamesizeX - 1 // on touch right turn left
            ? righting = 1
            : 0;
    ballPositionY == 0 ? upping = false : 0; // on touch up downing
  }

  bool ballTouchOnEnemy() {
    return true;
  }
}
//Developed By Tulumcu