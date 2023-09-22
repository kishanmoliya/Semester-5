import 'package:diploma_projects/Lab-4/05_roll_dice.dart';
import 'package:diploma_projects/Lab-5/03_GridViewDemo.dart';
import 'package:diploma_projects/Lab-5/04_GrideViewBuilderDemo.dart';
import 'package:diploma_projects/Lab-5/02_ListViewBuilderDemo.dart';
import 'package:diploma_projects/Lab-5/01_ListViewDemo.dart';
import 'package:diploma_projects/Lab-5/UserModelDemo.dart';
import 'package:diploma_projects/Lab-5/UserModelDemo2.dart';
import 'package:diploma_projects/Lab-5/listOfUsers.dart';
import 'package:flutter/material.dart';
//How to get flutter version
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RollDice(),
    );
  }
}



















// import 'package:diploma_projects/Lab-2/04_textFormField_property.dart';
// import 'package:diploma_projects/Lab-2/06_second_screen.dart';
// import 'package:diploma_projects/Lab-2/07_named_route.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/' : (context) => NamedRouting(),
//         '/second': (context) => SecondScreen(),
//       },
//     );
//   }
// }
