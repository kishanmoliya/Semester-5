// WAP to find friends detail by their name using dictionary. (Create local dictionary and search
// from it using Map<String,Object?> & Model Class).

import 'dart:io';

void main(List<String> args) {
  List<Map<String, dynamic>> list = [];

  list.add(
      {'name': 'Kishan', 'age': 20, 'enroll_no': 21010, 'degree': 'B.Tech'});
  list.add(
      {'name': 'Karan', 'age': 19, 'enroll_no': 21011, 'degree': 'M.Tech'});
  list.add({'name': 'Uttam', 'age': 19, 'enroll_no': 21012, 'degree': 'BSC'});
  list.add({'name': 'Rohan', 'age': 20, 'enroll_no': 21013, 'degree': 'MSC'});
  list.add({'name': 'Yash', 'age': 20, 'enroll_no': 21014, 'degree': 'MBBS'});

  stdout.write("Enter the Friend Name: ");
  String name = stdin.readLineSync()!;

  for (int i = 0; i < list.length; i++) {
    if (name == list[i]['name'].toString()) {
      print("Name : ${list[i]['name']}");
      print("Age : ${list[i]['age']}");
      print("EnrollNo : ${list[i]['enroll_no']}");
      print("Degree : ${list[i]['degree']}");
    }
  }
}
