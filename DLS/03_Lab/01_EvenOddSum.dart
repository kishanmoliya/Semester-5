// WAP to count number of even or odd number from an array of n numbers.

import 'dart:io';

void main() {
  stdout.write("Enter the Size of an Array = ");
  int n = int.parse(stdin.readLineSync()!);

  List num = [];

  int even = 0, odd = 0;
  for (int i = 0; i < n; i++) {
    stdout.write("Enter the ${i + 1} Array Element = ");
    num.add(int.parse(stdin.readLineSync()!));

    if (num[i] % 2 == 0) {
      even++;
    } else {
      odd++;
    }
  }

  print("Even Number in Array is = $even \nOdd Number in Array is = $odd");
}
