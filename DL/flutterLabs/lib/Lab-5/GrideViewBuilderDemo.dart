import 'package:flutter/material.dart';

class GrideViewBuilderDemo extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/dice1.png',
    'assets/images/dice2.png',
    'assets/images/dice3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text('Image Grid Example'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
