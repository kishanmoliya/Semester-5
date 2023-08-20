// Write a dart code to find the factorial of the given number.

import 'dart:io';

void main() {
  stdout.write("Enter the Number = ");
  int num = int.parse(stdin.readLineSync()!);

  int factorial = 1;
  for (int i = 1; i <= num; i++) {
    factorial *= i;
  }

  if (num != 0)
    print("Factorial of $num is = $factorial");
  else
    print("Factorial of $num = 1");
}
