//Write a dart code to find the percentage of 5 subjects.
import 'dart:io';

void main() {
  print('Done');
  stdout.write('Enter Subject 1 Marks = ');
  double? sub1 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Subject 2 Marks = ');
  double? sub2 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Subject 3 Marks = ');
  double? sub3 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Subject 4 Marks = ');
  double? sub4 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter Subject 5 Marks = ');
  double? sub5 = double.parse(stdin.readLineSync()!);

  double percentage = (sub1 + sub2 + sub3 + sub4 + sub5) * 100 / 500;

  print("Percentage of 5 subjects is = $percentage");
}
