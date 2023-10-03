import 'dart:convert';
import 'package:diploma_projects/Lab-7/services/MyAPI.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentListPage extends StatefulWidget {
  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  Future<List> getStudentData() async {
    http.Response student = await http.get(Uri.parse(MyAPI().api));
    return jsonDecode(student.body.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Demo'),
      ),
      body: FutureBuilder(
        future: getStudentData(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${snapshot.data![index]['Name']}'),
                      Text('Age: ${snapshot.data![index]['Age']}'),
                      Text('City: ${snapshot.data![index]['City']}'),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
