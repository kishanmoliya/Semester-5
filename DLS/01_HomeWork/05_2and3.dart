// Write a dart code to print numbers between two given numbers which are divisible by 2 but not
// divisible by 3.

import 'dart:io';

void main() {
  stdout.write("Enter num1 = ");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter num2 = ");
  int num2 = int.parse(stdin.readLineSync()!);

  for (int i = num1; i <= num2; i++) {
    if (i % 2 == 0 && i % 3 != 0) {
      stdout.write("$i ");
    }
  }
}
