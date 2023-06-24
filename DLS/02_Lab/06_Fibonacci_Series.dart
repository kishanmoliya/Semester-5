// WAP to generate Fibonacci series of N given number using method.

import 'dart:io';

void main() {
  stdout.write("Enter the Number = ");
  int n = int.parse(stdin.readLineSync()!);

  findFibonacci(n);
  //findFibonacci2(num: n);
  // findFibonacci3();
}

// Positional parameter
void findFibonacci(int n) {
  int a = 0, b = 1, temp = 0;

  for (int i = 0; i < n; i++) {
    stdout.write("$a ");
    temp = a + b;
    a = b;
    b = temp;
  }
}

// Named parameter
void findFibonacci2({required int num}) {
  int a = 0, b = 1, temp = 0;

  for (int i = 0; i < num; i++) {
    stdout.write("$a ");
    temp = a + b;
    a = b;
    b = temp;
  }
}

// Defalut parameter
void findFibonacci3([int n = 5]) {
  int a = 0, b = 1, temp = 0;

  for (int i = 0; i < n; i++) {
    stdout.write("$a ");
    temp = a + b;
    a = b;
    b = temp;
  }
}
