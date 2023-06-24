// WAP to find out largest number from given three numbers without using Logical Operator.

import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter num1 = ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter num2 = ");
  int num2 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter num3 = ");
  int num3 = int.parse(stdin.readLineSync()!);

  int temp = num1;
  if (num1 < num2) temp = num2;
  if (num2 < num3) temp = num3;
  print("Larjest Number from $num1, $num2, $num3 = $temp");

  //Second Method
  // if (num1 > num2) {
  //   if (num1 > num3) {
  //     print("Larjest Number from $num1, $num2, $num3 = $num1");
  //   } else {
  //     print("Larjest Number from $num1, $num2, $num3 = $num3");
  //   }
  // } else {
  //   if (num2 > num3) {
  //     print("Larjest Number from $num1, $num2, $num3 = $num2");
  //   } else {
  //     print("Larjest Number from $num1, $num2, $num3 = $num3");
  //   }
  // }
}
