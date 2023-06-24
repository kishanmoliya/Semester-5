// WAP program to calculate the sum of all positive even numbers and the sum of all negative
// odd numbers from a set of numbers. you can enter 0 (zero) to quit the program and thus it
// displays the result.

import 'dart:io';

void main() {
  int evenSum = 0, oddSum = 0;
  while (true) {
    stdout.write("Enter the Number = ");
    int n = int.parse(stdin.readLineSync()!);

    if (n == 0) {
      print("Positive Even Numbers Sum = $evenSum");
      print("Negative Odd Numbers Sum = $oddSum");
      exit(0);
    } else if (n % 2 == 0 && n > 0) {
      evenSum += n;
    } else if (n % 2 != 0 && n < 0) {
      oddSum += n;
    }
  }
}
