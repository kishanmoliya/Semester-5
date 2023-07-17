// Create a class named Member having the following members:
// 1 - Name
// 2 - Age
// 3 - Phone number
// 4 - Address
// 5 - Salary
// It also has a method named printSalary() which prints the salary of the members. Two classes
// Employee and Manager inherit the Member class. The Employee and Manager classes have
// data members specialization and department respectively. Now, assign name, age,
// phone_number, address and salary to an Employee and Manager by making an object of both
// of these classes and print the same along with specialization and department respectively.

import 'dart:io';

void main() {
  Employee e = new Employee(
      name: "kishan",
      age: 19,
      phone_no: 4567894567,
      address: "asdf",
      salary: 1230.25,
      specialization: "kjff");
  Manager m = new Manager("moliya", 18, 4451894567, "asdgfrf", 12380.25, "dep");
  e.printDetails();
  m.printDetails();
}

class Member {
  String? name;
  int? age;
  int? phone_no;
  String? address;
  double? salary;

  Member(
      {String? name,
      int? age,
      int? phone_no,
      String? address,
      double? salary}) {
    this.name = name;
    this.age = age;
    this.phone_no = phone_no;
    this.address = address;
    this.salary = salary;
  }
  // Member(String name, int age, int phone_no, String address, double salary) {}

  printSalary() {
    print("Salary = $salary");
  }
}

class Employee extends Member {
  String? specialization;

  Employee(
      {String? name,
      int? age,
      int? phone_no,
      String? address,
      double? salary,
      String? specialization})
      : super(
          address: address,
          age: age,
          name: name,
          phone_no: phone_no,
          salary: salary,
        ) {
    this.specialization = specialization;
  }

  printDetails() {
    print("   Employee Class");
    print("Name = $name");
    print("Age = $age");
    print("Phone_NO = $phone_no");
    print("Address = $address");
    print("Salary = $salary");
    print("Specialization = $specialization");
  }
}

class Manager extends Member {
  String? department;

  Manager(String name, int age, int phone_no, String address, double salary,
      String department)
      : super(
          address: address,
          age: age,
          name: name,
          phone_no: phone_no,
          salary: salary,
        ) {
    this.department = department;
  }

  printDetails() {
    print("\n   Menager Class");
    print("Name = $name");
    print("Age = $age");
    print("Phone_NO = $phone_no");
    print("Address = $address");
    print("Salary = $salary");
    print("DepartMent = $department");
  }
}
