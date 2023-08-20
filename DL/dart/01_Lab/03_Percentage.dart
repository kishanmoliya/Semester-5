//WAP to find percentage of 5 subject.

import 'dart:io';

void main() {
  stdout.write('Enter First Subject Marks = ');
  double sub1 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Second Subject Marks = ');
  double sub2 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Third Subject Marks = ');
  double sub3 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Forth Subject Marks = ');
  double sub4 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Fifth Subject Marks = ');
  double sub5 = double.parse(stdin.readLineSync()!);

  double percentage = (sub1 + sub2 + sub3 + sub4 + sub5) / 5;

  print("Your Percentage is = $percentage");
}
