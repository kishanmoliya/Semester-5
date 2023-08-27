import 'package:diploma_projects/firstScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: firstScreen(),
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
