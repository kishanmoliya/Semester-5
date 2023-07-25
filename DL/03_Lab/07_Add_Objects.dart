// Write a program to insert objects in List<dynamic> using function and display it using
// function. (Name, Age, Hobby).
import 'dart:io';

// void main(List<String> args) {
//   List<Map<String, dynamic>> person = [];

//   stdout.write("Enter the size of list : ");
//   int n = int.parse(stdin.readLineSync()!);

//   for (int i = 0; i < n; i++) {
//     stdout.write("Enter the Name: ");
//     String n = stdin.readLineSync()!;
//     stdout.write("Enter the Age: ");
//     int a = int.parse(stdin.readLineSync()!);
//     stdout.write("Enter the hobby: ");
//     String h = stdin.readLineSync()!;

//     person.add(insertMap(name: n, age: a, hobby: h));
//   }
//   display(person);
// }

// Map<String, dynamic> insertMap({name, age, hobby}) {
//   Map<String, dynamic> map = {
//     'name': name,
//     'age': age,
//     'hobby': hobby,
//   };

//   return map;
// }

// void display(person) {
//   for (int i = 0; i < person.length; i++) {
//     print("\nName : ${person[i]['name']}");
//     print("Age : ${person[i]['age']}");
//     print("Hobby : ${person[i]['hobby']}");
//   }
// }

// List<Map<String, dynamic>> l1 = [];

// void main(List<String> args) {
//   addObj('kishan', 20, 'xyz');
//   addObj('kishagdn', 20, 'xyfdz');
//   display();
// }

// void addObj(name, age, hobby) {
//   l1.add({'name': name, 'age': age, 'hobby': hobby});
// }

// void display() {
//   print(l1);
// }

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
