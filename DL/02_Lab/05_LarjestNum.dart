// WAP to find maximum number from given two numbers using method

import 'dart:io';

void main() {
  stdout.write("Enter the Number 1 = ");
  double num1 = double.parse(stdin.readLineSync()!);
  stdout.write("Enter the Number 2 = ");
  double num2 = double.parse(stdin.readLineSync()!);

  findLargNum(num1, num2);
  //findLargNum2(a: num1, b: num2);
  //findLargNum3();
}

// Positional parameter
void findLargNum(double num1, double num2) {
  print(num1 > num2
      ? "Larjest Number form $num1 and $num2 is = $num1"
      : "Larjest Number form $num1 and $num2 is = $num2");
}

// Named parameter
void findLargNum2({required double a, required double b}) {
  print(a > b
      ? "Larjest Number form $a and $b is = $a"
      : "Larjest Number form $a and $b is = $b");
}

// Defalut parameter
void findLargNum3([double a = 5, double b = 10]) {
  print(a > b
      ? "Larjest Number form $a and $b is = $a"
      : "Larjest Number form $a and $b is = $b");
}
