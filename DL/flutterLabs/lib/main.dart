import 'package:diploma_projects/Lab-4/05_roll_dice.dart';
import 'package:diploma_projects/Lab-5/03_GridViewDemo.dart';
import 'package:diploma_projects/Lab-5/04_GrideViewBuilderDemo.dart';
import 'package:diploma_projects/Lab-5/02_ListViewBuilderDemo.dart';
import 'package:diploma_projects/Lab-5/01_ListViewDemo.dart';
import 'package:diploma_projects/Lab-6/01_UserModelDemo.dart';
import 'package:diploma_projects/Lab-5/listOfUsers.dart';
import 'package:diploma_projects/Lab-6/02_Tav_View.dart';
import 'package:diploma_projects/Lab-6/03_Drawer/homePage.dart';
import 'package:diploma_projects/Lab-6/04_ActionBarDemo.dart';
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
      debugShowCheckedModeBanner: false,
      home: ActionBarDemo(),
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
