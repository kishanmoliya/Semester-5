// WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.

import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the Number = ");
  int n = int.parse(stdin.readLineSync()!);

  print(checkPrime(n));
  // checkPrime2(num: n);
  // checkPrime3();
}

int checkPrime(int n) {
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      return 0;
    }
  }
  return 1;
}

// Named parameter
checkPrime2({required int num}) {
  bool flage = true;
  for (int i = 2; i <= num / 2; i++) {
    if (num % i == 0) {
      flage = false;
      break;
    }
  }

  print(flage && num != 0 && num != 1
      ? "Number is Prime"
      : "Number is Not Prime");
}

// Defalut parameter
checkPrime3([int n = 13]) {
  bool flage = true;
  for (int i = 2; i <= n / 2; i++) {
    if (n % i == 0) {
      flage = false;
      break;
    }
  }

  print(flage && n != 0 && n != 1 ? "Number is Prime" : "Number is Not Prime");
}
