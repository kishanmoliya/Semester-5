import 'package:diploma_projects/Lab-4/05_roll_dice.dart';
import 'package:diploma_projects/Lab-5/GridViewDemo.dart';
import 'package:diploma_projects/Lab-5/GrideViewBuilderDemo.dart';
import 'package:diploma_projects/Lab-5/ListViewBuilderDemo.dart';
import 'package:diploma_projects/Lab-5/ListViewDemo.dart';
import 'package:diploma_projects/Lab-5/UserModelDemo.dart';
import 'package:diploma_projects/Lab-5/listOfUsers.dart';
import 'package:flutter/material.dart';

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
      home: UserModeliew(),
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
