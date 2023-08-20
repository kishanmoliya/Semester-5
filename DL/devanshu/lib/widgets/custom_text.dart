import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomText extends StatelessWidget {
  String? text;
  final size;
  final weight;
  final color;
  final alignment;
  CustomText(text, {Key? key, this.size = 15, this.color, this.weight, this.alignment})
      : super(key: key) {
    this.text = text.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,textAlign: alignment,
      style: TextStyle(fontSize: size * 1.0, fontWeight: weight, color: color,),
    );
  }
}
