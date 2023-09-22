import 'package:flutter/material.dart';

class UserModeliew extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      name: 'raman',
      surname: 'trada',
      birthdate: 'January 1, 2000',
      city: 'Rajkot',
    ),
    UserModel(
      name: 'xyz',
      surname: 'abc',
      birthdate: 'January 15, 2005',
      city: 'Morbi',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Grid View'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2
        ),
        children: users.map((user) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}'),
                  Text('Surname: ${user.surname}'),
                  Text('Birthdate: ${user.birthdate}'),
                  Text('City: ${user.city}'),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class UserModel {
  final String name;
  final String surname;
  final String birthdate;
  final String city;

  UserModel({
    required this.name,
    required this.surname,
    required this.birthdate,
    required this.city,
  });
}