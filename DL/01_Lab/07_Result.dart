// WAP to read marks of five subjects. Calculate percentage and print class accordingly. Fail
// below 35, Pass Class between 35 to 45, Second Class between 45 to 60, First Class between 60
// to 70, Distinction if more than 70.

import 'dart:io';

void main() {
  stdout.write("Enter First Subject Marks = ");
  double a = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Second Subject Marks = ");
  double b = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Third Subject Marks = ");
  double c = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Forth Subject Marks = ");
  double d = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Fifth Subject Marks = ");
  double e = double.parse(stdin.readLineSync()!);

  double percentage = (a + b + c + d + e) / 5;

  if (percentage < 35)
    print("You Got $percentage percentage and Sorry You are Fail!");
  else if (percentage >= 35 && percentage < 45)
    print("You Got $percentage percentage and You are Pass Keep it up");
  else if (percentage >= 45 && percentage < 60)
    print("You Got $percentage percentage and You are in Second Class");
  else if (percentage >= 60 && percentage < 70)
    print("You Got $percentage percentage and You are in First Class");
  else
    print("Distinction");
}
