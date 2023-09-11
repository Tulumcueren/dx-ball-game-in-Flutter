// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Box extends StatefulWidget {
  Color status = Colors.blueAccent;
  bool ball = false;
  Box({
    Key? key,
    required this.status,
    required this.ball,
  }) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: widget.status,
          border: Border.all(width: 1, color: Colors.black)),
      width: 25,
      height: 25,
      child: widget.ball
          ? Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(25)),
            )
          : Container(),
    );
  }
}
