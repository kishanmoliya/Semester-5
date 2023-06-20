//Write a dart code to convert temperature from Fahrenheit to Celsius.[°C = [(°F-32)×5]/9, °F = °C * 1.8000]
import 'dart:io';

void main() {
  stdout.write('Enter the Temperature in Fahrenheit = ');
  double? fahrenheit = double.parse(stdin.readLineSync()!);

  double celsisu = (fahrenheit - 32) * 5 / 9;

  print('$fahrenheit in celsius is = $celsisu');
}
