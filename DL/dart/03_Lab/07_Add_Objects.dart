// Write a program to insert objects in List<dynamic> using function and display it using
// function. (Name, Age, Hobby).
import 'dart:io';

List l1 = [];

void main(List<String> args) {
  int n = 2;
  for (int i = 0; i < n; i++) {
    stdout.write("Enter the name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter the age: ");
    int age = int.parse(stdin.readLineSync()!);

    stdout.write("Enter the hobby: ");
    String hobby = stdin.readLineSync()!;

    addObj(name, age, hobby);
  }

  display();
}

void addObj(name, age, hobby) {
  l1.add({'name': name, 'age': age, 'hobby': hobby});
}

void display() {
  for (int i = 0; i < l1.length; i++) {
    print("Persion ${i + 1} Details...");
    print('Name: ${l1[i]['name']}');
    print('Age: ${l1[i]['age']}');
    print('Hobby: ${l1[i]['hobby']} \n');
  }
}
