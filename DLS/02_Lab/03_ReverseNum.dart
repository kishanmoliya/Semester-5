// WAP to print given numer in reverse order.
import 'dart:io';

void main() {
  stdout.write("Enter the numer = ");
  int num = int.parse(stdin.readLineSync()!);

  int rem;
  int reverse = 0;
  while (num > 0) {
    rem = num % 10;
    reverse = reverse * 10 + rem;
    num = num ~/ 10;
  }
  print(reverse);
}
