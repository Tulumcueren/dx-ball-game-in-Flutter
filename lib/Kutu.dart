// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Kutu extends StatefulWidget {
  Color status = Colors.blueAccent;
  bool ball = false;
  Kutu({
    Key? key,
    required this.status,
    required this.ball,
  }) : super(key: key);

  @override
  State<Kutu> createState() => _KutuState();
}

class _KutuState extends State<Kutu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: widget.status,
          border: Border.all(width: 1, color: Colors.black)),
      child: widget.ball
          ? Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(25)),
            )
          : Container(),
      width: 25,
      height: 25,
    );
  }
}
