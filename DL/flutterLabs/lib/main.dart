import 'package:diploma_projects/Lab-1/02_horizontal_part.dart';
import 'package:diploma_projects/Lab-2/06_material_page_rout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MaterialPageRoutee(),
    );
  }
}

//4. WAP to use TextField & apply different borders,
// floating labels, hint text etc.
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

// import 'package:flutter/material.dart';
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       title: 'Stack Widget',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Demo(),
//     );
//   }
// }
//
// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(HorizontalPart());
// }
//
// class HorizontalPart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Horizontal Part'),
//         ),
//         body: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 color: Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(demo());
// }
//
// class demo extends StatefulWidget{
//   State<demo> createState(){
//     return demoState();
//   }
// }
//
// class demoState extends State<demo>{
//   String city = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           child: Column(
//             children: [
//               TextField(
//                 onSubmitted: (String userinout){
//                   setState(() {
//                     city = userinout;
//                   });
//                 }
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext buildContext) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('First App'),
//         ),
//         body: TextField(
//           onChanged: (value) {
//             print(value);
//           },
//         ),
//       ),
//     );
//   }
// }
