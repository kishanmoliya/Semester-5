//WAP to create list of images path in List<String> and display it using Gridview and then
// Gridview.builder
import 'package:flutter/material.dart';

class GrideViewDemo extends StatelessWidget {
  List imagePath = [
    'assets/images/dice2.png',
    'assets/images/dice3.png',
    'assets/images/dice4.png',
    'assets/images/dice5.png',
    'assets/images/dice6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: imagePath.length,
          itemBuilder: (context, index) {
            return Image.asset(imagePath[index]);
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class GrideViewBuilderDemo extends StatelessWidget {
//   final List<String> imagePaths = [
//     'assets/images/dice4.png',
//     'assets/images/dice2.png',
//     'assets/images/dice3.png',
//     'assets/images/dice4.png',
//     'assets/images/dice5.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Image Grid Example'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 5,
//           mainAxisSpacing: 5
//         ),
//         itemCount: imagePaths.length,
//         itemBuilder: (context, index) {
//           return Image.asset(
//             imagePaths[index],
//           );
//         },
//       ),
//     );
//   }
// }
