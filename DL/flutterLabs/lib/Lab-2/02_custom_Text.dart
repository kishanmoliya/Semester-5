import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Text Widget"),
      ),
      body: customText(),
    );
  }

  Widget customText() {
    return Center(
      child: Text(
        'Custom Text.',
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'Borel'),
      ),
    );
  }
}
