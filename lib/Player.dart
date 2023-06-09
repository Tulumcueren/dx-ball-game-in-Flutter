class gamePlayer {
  double positionX;
  double positionY;
  double gamesizeX;
  double gamesizeY;
  double playerWidth;
  gamePlayer({
    required this.positionX,
    required this.positionY,
    required this.gamesizeX,
    required this.gamesizeY,
    required this.playerWidth,
  });
  double movementRightX({double speed = 1}) {
    print(positionX);
    return positionX <= gamesizeX - 4 ? positionX += speed : positionX;
  }

  double movementLeftX({double speed = 1}) {
    print(positionX);

    return positionX >= 1 ? positionX -= speed : positionX;
  }

  double movementUpY({double speed = 1}) {
    return positionY >= 1 ? positionY -= speed : positionY;
  }

  double movementDownY({double speed = 1}) {
    return positionY <= gamesizeY - 2 ? positionY += speed : positionY;
  }

  bool playerPositioninMap(x, y) {
    //(positionX == gamesizeX - 1 || positionY == gamesizeY - 1) ||
    return positionX == x && positionY == y ||
        positionX + playerWidth == x && positionY == y ||
        positionX + playerWidth + 1 == x && positionY == y;
  }
}
