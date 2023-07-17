// Write a dart code to create a Circle class with area() and perimeter() function to find area and
// perimeter of the circle.

import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("Enter thr Reedis = ");
  dynamic redis = double.parse(stdin.readLineSync()!);

  Circle cr = Circle();
  cr.area(redis);
  cr.perimeter(redis);
}

class Circle {
  area(double redis) {
    print("The Area of Circle = ${pi * redis * redis}");
  }

  perimeter(double redis) {
    print("The Perimeter of Circle = ${2 * pi * redis}");
  }
}


//pir~
//2pir