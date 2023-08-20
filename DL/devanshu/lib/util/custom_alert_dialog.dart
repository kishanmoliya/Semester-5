import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final double width;
  final double height;
  final Widget content;

  CustomAlertDialog({required this.width, required this.height, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: width,
        height: height,
        child: content,
      ),
    );
  }
}