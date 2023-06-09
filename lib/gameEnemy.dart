// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class EnemysMapping {
  String x;
  String y;
  int X;
  int Y;
  EnemysMapping({
    required this.x,
    required this.y,
    required this.X,
    required this.Y,
  });
}

class Enemy {
  List<EnemysMapping> EnemyMap = [];
  int levelX;
  int levelY;
  Enemy({
    required this.levelX,
    required this.levelY,
  });
  void EnemyGenerator() {
    for (int y = 0; y < levelY; y++)
      // ignore: curly_braces_in_flow_control_structures
      for (int x = 0; x < levelX; x++) {
        EnemyMap.add(EnemysMapping(
            x: "x$x",
            y: "y$y",
            X: Random().nextInt(levelX),
            Y: Random().nextInt(levelY)));
        //
      }
  }

  bool EnemyFinder(int x, int y) {
    EnemyMap.indexWhere((element) => element.x == "x$x" && element.y == "y$y");
    return true;
  }
}
