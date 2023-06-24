//WAP to Print addition of 2 number

import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the First Number : ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter the Second Number : ");
  int num2 = int.parse(stdin.readLineSync()!);

  print("The sum of ${num1} and ${num2} is = ${num1 + num2}");
}
