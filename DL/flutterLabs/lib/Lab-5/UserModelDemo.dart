import 'package:flutter/material.dart';

class UserModeliew extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      name: 'John',
      surname: 'Doe',
      birthdate: 'January 1, 1990',
      city: 'New York',
    ),
    UserModel(
      name: 'Jane',
      surname: 'Smith',
      birthdate: 'February 15, 1985',
      city: 'Los Angeles',
    ),
    // Add more users as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
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