import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  BoldText({Key? key, this.size = 15, this.text, this.color}) : super(key: key);
  final size;
  final text;
  final color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size * 1.0, fontWeight: FontWeight.bold, color: color),
    );
  }
}
