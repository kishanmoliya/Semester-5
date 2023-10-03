//WAP to use the ActionBar widget and display menu in it and display Alert Dialog on menu
// click
import 'package:flutter/material.dart';

class ActionBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action bar demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Action bar demo'),
                    content: Text('Are you sure you want to Contnue'),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class ActionBarDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Action bar'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('dialog'),
//                       content: Text('Dialog content'),
//                       actions: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text('ok'),
//                         ),
//                       ],
//                     );
//                   });
//             },
//           )
//         ],
//       ),
//       // appBar: AppBar(
//       //   title: Text('Action Bar'),
//       //   actions: [
//       //     IconButton(
//       //       icon: Icon(Icons.add),
//       //       onPressed: () {
//       //         showDialog(
//       //           context: context,
//       //           builder: (BuildContext context) {
//       //             return AlertDialog(
//       //               title: Text('Alert Dialog'),
//       //               content: Text('This is an AlertDialog!'),
//       //               actions: [
//       //                 ElevatedButton(
//       //                   child: Text('OK'),
//       //                   onPressed: () {
//       //                     Navigator.of(context).pop(); // Close the AlertDialog
//       //                   },
//       //                 ),
//       //               ],
//       //             );
//       //           },
//       //         );
//       //       },
//       //     ),
//       //   ],
//       // ),
//       body: Center(
//         child: Text('Action Bar Demo'),
//       ),
//     );
//   }
// }
