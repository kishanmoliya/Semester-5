// WAP that calculates area of circle, triangle and square using method overloading.

import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Enter the Redis = ");
  double redis = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Hight = ");
  double hight = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Base = ");
  double base = double.parse(stdin.readLineSync()!);

  stdout.write("Enter the Area = ");
  double? a = double.parse(stdin.readLineSync()!);

  findArea(circle: redis, triHight: hight, triBase: base, squre: a);
}

void findArea(
    {double circle = 0, //aslo done with double? circle : 0,
    double triHight = 0,
    double triBase = 0,
    double squre = 0}) {
  double circleArea = pi * circle * circle;
  print("Area of Circle = $circleArea");

  double triangleArea = triHight * triBase / 2;
  print("Area of Triangle = $triangleArea");

  double squreArea = squre * squre;
  print("Area of Squre = $squreArea");
}
