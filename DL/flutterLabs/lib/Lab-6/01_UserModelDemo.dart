//WAP to create list of user using List<UserModel> and display using Gridview.builder.
import 'package:flutter/material.dart';

class UserModelDemo extends StatelessWidget {
  List<UserModel> user = [
    UserModel(name: 'kishan', surname: 'moliya', city: 'rajkot'),
    UserModel(name: 'kishan', surname: 'moliya', city: 'rajkot'),
    UserModel(name: 'kishan', surname: 'moliya', city: 'rajkot'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Model demo'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: user.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text('${user[index].name}'),
              Text('${user[index].surname}'),
              Text('${user[index].city}')
            ],
          );
        },
      ),
    );
  }
}

class UserModel {
  String name;
  String surname;
  String city;

  UserModel({required this.name, required this.surname, required this.city});
}

// import 'package:flutter/material.dart';
//
// class UserModeliew extends StatelessWidget {
//   List<UserModel> users = [
//     UserModel(
//       name: 'raman',
//       surname: 'trada',
//       birthdate: 'January 1, 2000',
//       city: 'Rajkot',
//     ),
//     UserModel(
//       name: 'xyz',
//       surname: 'abc',
//       birthdate: 'January 15, 2005',
//       city: 'Morbi',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Grid View'),
//       ),
//       body: GridView.builder(
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Text('${users[index].name}'),
//               Text('${users[index].surname}'),
//               Text('${users[index].birthdate}'),
//               Text('${users[index].city}')
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class UserModel {
//   final String name;
//   final String surname;
//   final String birthdate;
//   final String city;
//
//   UserModel({
//     required this.name,
//     required this.surname,
//     required this.birthdate,
//     required this.city,
//   });
// }
