// Write a dart code to create a Circle class with area() and perimeter() function to find area and
// perimeter of the circle.

import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Enter thr Reedis = ");
  dynamic radius = double.parse(stdin.readLineSync()!);

  Circle cr = Circle();
  cr.area(radius);
  cr.perimeter(radius);
}

class Circle {
  area(double radius) {
    print("The Area of Circle = ${pi * radius * radius}");
  }

  perimeter(double radius) {
    print("The Perimeter of Circle = ${2 * pi * radius}");
  }
}


//pir~
//2pir