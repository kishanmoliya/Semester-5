//WAP to use the NavigationDrawer & display different pages on different menu clicks.
import 'package:flutter/material.dart';

class DrawerDemo extends StatefulWidget {
  @override
  State<DrawerDemo> createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  List<Widget> screens = [
    Center(child: Text('Home'),),
    Center(child: Text('About us'),),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drawer Demo'),
        ),
        body: screens[index],
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                selected: index == 0,
                title: Text('Home'),
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                selected: index == 1,
                title: Text('About us'),
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class DrawerDemo extends StatefulWidget {
//   @override
//   State<DrawerDemo> createState() => _DrawerDemoState();
// }
//
// class _DrawerDemoState extends State<DrawerDemo> {
//   int index = 0;
//   List<Widget> screen = [
//     Text('Screen 1'),
//     Text('Screen 2'),
//   ];
// @override
// Widget build(BuildContext context) {
//
//   return Scaffold(
//     appBar: AppBar(title: Text('App Bar Demo'),),
//     body: screen[index],
//     drawer: Drawer(
//       child: ListView(
//         children: [
//           ListTile(
//             selected: index == 0,
//             title: Text('Screen1'),
//             onTap: () {
//               setState(() {
//                 index = 0;
//               });
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             selected: index == 1,
//             title: Text('Screen2'),
//             onTap: () {
//               setState(() {
//                 index = 1;
//               });
//               Navigator.pop(context);
//             },
//           )
//         ],
//       ),
//     ),
//   );
// }
// }
