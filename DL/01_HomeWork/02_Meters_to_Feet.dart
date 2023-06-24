//Write a dart code that reads a number in meters, converts it to feet, and displays the result
import 'dart:io';

void main() {
  stdout.write("Enter the value of meters = ");
  double meters = double.parse(stdin.readLineSync()!);

  double feet = meters * 3.28084;

  print('$meters meters = $feet feet');
}
