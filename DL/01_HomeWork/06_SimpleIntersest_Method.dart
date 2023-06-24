// Write a dart code to calculate simple interest using a method.

import 'dart:io';

void main() {
  stdout.write("Enter the Principal = ");
  double p = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the Rate = ");
  double r = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the Time = ");
  double t = double.parse(stdin.readLineSync()!);

  findInterest(p, r, t);
}

void findInterest(double p, double r, double t) {
  double interest = (p * r * t) / 100;
  print("Simple Interest = $interest");
}
