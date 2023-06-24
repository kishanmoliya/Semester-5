// Write a dart code to accept n numbers in an array. Display the sum of all the numbers which are
// divisible by either 3 or 5.

import 'dart:io';

void main() {
  stdout.write("Enter the value of an Array = ");
  int n = int.parse(stdin.readLineSync()!);

  List numb = [];

  int count = 0;
  for (int i = 0; i < n; i++) {
    stdout.write("Enter the ${i + 1} Array Element = ");
    numb.add(int.parse(stdin.readLineSync()!));

    if (numb[i] % 3 == 0 || numb[i] % 5 == 0) {
      //print("All num = $numb[i]");
      count += numb[i] as int;
    }
  }

  print("The sum of numbers = $count");
}
