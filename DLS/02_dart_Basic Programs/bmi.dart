// Body Mass Index (BMI) is a measure of health on weight. It can be calculated by taking your
// weight in kilograms and dividing by the square of your height in meters. Write a dart code that
// prompts the user to enter a weight in pounds and height in inches and display the BMI.
// Note: 1 pound = .45359237 kg and 1 inch = 0.254 meters

import 'dart:io';

void main() {
  stdout.write("Enter your Weight in kilograms = ");
  double? pound = double.parse(stdin.readLineSync()!);

  stdout.write("Enter your Height in meters = ");
  double? inch = double.parse(stdin.readLineSync()!);

  double BMI = (pound * 0.45359237) / ((inch * 0.254) * (inch * 0.254));

  print("BMI = $BMI");
}
