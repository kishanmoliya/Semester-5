// AP to perform Addition, Subtraction, Multiplication, Division based on user choice using if,
// if..else..if, & switch.

import 'dart:io';

void main() {
  stdout.write("Enter First Number = ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter Second Number = ");
  double num2 = double.parse(stdin.readLineSync()!);

  stdout
      .write("Enter Choice Addition, Subtraction, Multiplication, Division = ");
  String operation = stdin.readLineSync()!;

  iff(num1, num2, operation);
  ifElseIf(num1, num2, operation);
  switcasee(num1, num2, operation);
}

void ifElseIf(double num1, double num2, String operation) {
  print('\n2. Using If..else..if');
  if (operation == "Addition")
    print("Addition of $num1 and $num2 = ${num1 + num2}");
  else if (operation == "Subtraction")
    print("Subtraction of $num1 and $num2 = ${num1 - num2}");
  else if (operation == "Multiplication")
    print("Multiplication of $num1 and $num2 = ${num1 * num2}");
  else if (operation == "Division")
    print("Division of $num1 and $num2 = ${num1 / num2}");
  else {
    print("Please Enter tha valid Operaion!");
  }
}

iff(double num1, double num2, String operation) {
  print('\n1. Using IF Statment');
  if (operation == "Addition")
    print("Addition of $num1 and $num2 = ${num1 + num2}");
  if (operation == "Subtraction")
    print("Subtraction of $num1 and $num2 = ${num1 - num2}");
  if (operation == "Multiplication")
    print("Multiplication of $num1 and $num2 = ${num1 * num2}");
  if (operation == "Division")
    print("Division of $num1 and $num2 = ${num1 / num2}");
}

switcasee(double num1, double num2, String operation) {
  print('\n3. Using Switch case');
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
