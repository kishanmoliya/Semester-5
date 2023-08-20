// WAP that calculates area of circle, triangle and square using method overloading.

import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Enter the radius = ");
  double radius = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Hight = ");
  double hight = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Base = ");
  double base = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Area = ");
  double a = double.parse(stdin.readLineSync()!);

  findArea(circle: radius, triHight: hight, triBase: base, squre: a);

  // findArea(circle: radius);

  // findArea(triHight: hight);

  // findArea(triHight: hight);

  // findArea(squre: a);
}

void findArea(
    {double circle = 8,
    double triHight = 2,
    double triBase = 6,
    double squre = 5}) {
  double circleArea = pi * circle * circle;
  print("Area of Circle = $circleArea");

  double triangleArea = triHight * triBase / 2;
  print("Area of Triangle = $triangleArea");

  double squreArea = squre * squre;
  print("Area of Squre = $squreArea");
}
