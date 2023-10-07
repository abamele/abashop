import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {Key? key,
        required this.text,
        this.overflow,
        required this.color,
        required this.textSize,
        this.isTile = false,
        this.maxLine = 10})
      : super(key: key);
  final String text;
  final TextOverflow? overflow;
  final Color color;
  final double textSize;
  bool isTile;
  int maxLine = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: textSize,
          color: color,
          fontWeight: isTile ? FontWeight.bold : FontWeight.normal),
    );
  }
}
