// Write a dart code to make a Simple Calculator using switch...case.

import 'dart:io';

void main() {
  stdout.write("Enter Num 1 = ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Num 2 = ");
  double num2 = double.parse(stdin.readLineSync()!);

  stdout
      .write("Enter Choice Addition, Subtraction, Multiplication, Division = ");
  String operation = stdin.readLineSync()!;

  switch (operation) {
    case "Addition":
      print("Addition of $num1 and $num2 = ${num1 + num2}");
      break;

    case "Subtraction":
      print("Subtraction of $num1 and $num2 = ${num1 - num2}");
      break;

    case "Multiplication":
      print("Multiplication of $num1 and $num2 = ${num1 * num2}");
      break;

    case "Division":
      print("Division of $num1 and $num2 = ${num1 / num2}");
      break;

    default:
      print("Please Enter tha valid Operaion!");
  }
}
