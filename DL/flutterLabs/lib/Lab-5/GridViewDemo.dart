import 'package:flutter/material.dart';

class GrideViewDemo extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/dice1.png',
    'assets/images/dice6.png',
    'assets/images/dice3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text('Image Grid Example'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5
        ),
       children: imagePaths.map((e) => Image.asset(e)).toList(),
      ),
    );
  }
}
