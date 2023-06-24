// WAP to insert double into List<double> and display in terminal and do sum of all numbers and
// print it with 2 decimal only.
// Ex: Total = 22.39998 => 22.40

import 'dart:io';

void main() {
  List numbers = [];

  numbers.add(10.5);
  numbers.add(5.25);
  numbers.add(3.75);

  double sum = 0;
  numbers.forEach((value) {
    sum += value;
  });

  print(sum.toStringAsFixed(2));

  // Second Method
  //
  // stdout.write("Enter the Size of an Array = ");
  // int n = int.parse(stdin.readLineSync()!);

  // List num = [];

  // double Total = 0;
  // for (int i = 0; i < n; i++) {
  //   stdout.write("Enter the ${i + 1} Array Number = ");
  //   num.add(double.parse(stdin.readLineSync()!));

  //   Total += num[i];
  // }

  // print(Total.toStringAsFixed(2));
}
