// Define Time class with hour and minute as data member. Also define addition method to add
// two-time objects.
import 'dart:io';

void main(List<String> args) {
  stdout.write("Enter the First Hour = ");
  int h1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the First Minute = ");
  int m1 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Second Hour = ");
  int h2 = int.parse(stdin.readLineSync()!);
  stdout.write("Enter the Second Minute = ");
  int m2 = int.parse(stdin.readLineSync()!);

  Time t = Time();
  t.addition(h1, h2, m1, m2);
}

class Time {
  int? hour;
  int? minute;

  void addition(int h1, int h2, int m1, int m2) {
    //int temp = ((m1 + m2) % 60);
    minute = (m1 + m2) % 60;
    // if ((m1 + m2) ~/ 60 == 1)
    //   hour = h1 + h2 + 1;
    // else
    hour = h1 + h2 + ((m1 + m2) ~/ 60);

    print("First Time: $h1 Hour and $m1 minit");
    print("Second Time: $h2 Hour and $m2 minit");
    print("Sum of two time is: $hour Hour and $minute minit");
  }
}
