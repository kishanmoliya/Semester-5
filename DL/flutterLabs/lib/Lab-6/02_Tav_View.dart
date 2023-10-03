//WAP to use TabView and display different pages on different tab clicks.
import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tab bar demo'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Screen 1'),),
              Center(child: Text('Screen 2'),),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class TabViewDemo extends StatefulWidget {
//   const TabViewDemo({Key? key}) : super(key: key);
//
//   @override
//   State<TabViewDemo> createState() => _TabViewDemoState();
// }
//
// class _TabViewDemoState extends State<TabViewDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Tab Bar"),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 text: "Tab 1",
//               ),
//               Tab(
//                 text: "Tab 2",
//               ),
//               Tab(
//                 text: "Tab 3",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Center(child: Text('First Tab')),
//             Center(child: Text('Second Tab')),
//             Center(child: Text('Third Tab')),
//           ],
//         ),
//       ),
//     );
//   }
// }
