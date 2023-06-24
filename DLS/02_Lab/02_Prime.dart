// Write a dart code to find whether the given number is prime or not.

import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  stdout.write("Enter the Number = ");
  int num = int.parse(stdin.readLineSync()!);

  bool flage = true;
  for (int i = 2; i <= sqrt(num); i++) {
    if (num % i == 0) {
      flage = false;
      break;
    }
  }

  print(flage && num != 0 && num != 1
      ? "Number is Prime"
      : "Number is Not Prime");
}
