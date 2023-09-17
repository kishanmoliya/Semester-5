import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  List<Map<String, dynamic>> users = [
    {
      'name': 'raman',
      'surname': 'trada',
      'birthdate': 'January 1, 2000',
      'city': 'surat',
    },
    {
      'name': 'krishna',
      'surname': 'kohli',
      'birthdate': 'march 17, 2005',
      'city': 'rajkot',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          // return Column(
          //           //   crossAxisAlignment: CrossAxisAlignment.start,
          //           //   children: [
          //           //     Text('Name: ${users[index]['name']}'),
          //           //     Text('Surname: ${users[index]['surname']}'),
          //           //     Text('Birthdate: ${users[index]['birthdate']}'),
          //           //     Text('City: ${users[index]['city']}'),
          //           //   ],
          return ListTile(
            title: Text('Name: ${users[index]['name']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Surname: ${users[index]['surname']}'),
                Text('Birthdate: ${users[index]['birthdate']}'),
                Text('City: ${users[index]['city']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}



