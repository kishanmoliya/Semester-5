//WAP to check whether the given number is positive or negative.

import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the First Number : ");
  int num1 = int.parse(stdin.readLineSync()!);

  print(num1 >= 0 ? "Positive" : "Negative");

  //Second Method
  // if (num1 >= 0)
  //   print("It's Positive Number");
  // else
  //   print("It's Neative Number");
}
