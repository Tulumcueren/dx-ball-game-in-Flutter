class Ball {
  int ballPositionX = 0;
  int ballPositionY = 0;
  Ball({
    required this.ballPositionX,
    required this.ballPositionY,
  });
  bool centerBall(int x, int y) {
    return ballPositionX == x && ballPositionY == y ? true : false;
  }

  int ballNewtoning() {
    return ballPositionY += 1;
  }

  int ballUpping() {
    return ballPositionY -= 1;
  }
}
