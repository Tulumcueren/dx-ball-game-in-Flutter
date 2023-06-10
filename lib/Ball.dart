class Ball {
  int ballPositionX = 0;
  int ballPositionY = 0;
  bool upping = false;
  int righting = 0;

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

//rightin 0 1 2
//upping false true
  void ballXYMovmentManager(int speed, int playerpositionY, int playerpositionX,
      int gamesizeX, int gamesizeY) {
    /*  if (upping == false) {
      ballPositionY += speed;
      if (ballPositionY == playerpositionY - 1 &&
          ballPositionX == playerpositionX + 1) {
        upping = true;
      }
      if (ballPositionY == playerpositionY - 1 &&
              ballPositionX == playerpositionX ||
          ballPositionY == playerpositionY - 1 &&
              ballPositionX == playerpositionX - 1) {
        upping = true;
        righting = 1;
        ballPositionX -= speed;
        ballPositionY -= speed;
      }
      if (ballPositionY == playerpositionY - 1 &&
              ballPositionX == playerpositionX + 2 ||
          ballPositionY == playerpositionY - 1 &&
              ballPositionX == playerpositionX + 3) {
        ballPositionX += speed;
        ballPositionY -= speed;
      } */
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

  /* upping == false
        ? ballPositionY += speed
        : upping == true
            ? ballPositionY -= speed
            : speed;
    ballPositionY <= 0 ? upping = false : ballPositionY;
    ballPositionY == playerpositionY - 1 && ballPositionX == playerpositionX + 1
        ? upping = true
        : upping;
    ballPositionY == playerpositionY - 1 &&
                ballPositionY == playerpositionY - 1 &&
                righting == 0 &&
                ballPositionX == playerpositionX ||
            ballPositionY == playerpositionY - 1 &&
                ballPositionY == playerpositionY - 1 &&
                righting == 0 &&
                ballPositionX == playerpositionX - 1
        ? (ballPositionX -= speed, upping = true, righting = 2)
        : ballPositionX;
    ballPositionX == 0 ? righting = 1 : righting;
    righting == 1 ? ballPositionX += speed : ballPositionX;
    ballPositionX == gamesizeX ? righting = 0 : righting;
    righting == 2 ? ballPositionX -= speed : righting;
    ballPositionX >= gamesizeX - 1 ? righting = 2 : righting;
    ballPositionY == playerpositionY - 1 && playerpositionX + 2 == ballPositionX
        ? (upping = true, righting = 1)
        : upping; */
}
