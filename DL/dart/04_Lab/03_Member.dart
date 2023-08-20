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

class Member {
  int? age;
  String? name, address;
  num? phone_number, salary;

  void printSalary() {
    print("Salary : ${salary}\n");
  }
}

class Employee extends Member {
  String? specialzation;
}

class Manager extends Member {
  String? department;
}

void main() {
  Employee e = Employee();
  e.name = "Kishan";
  e.age = 21;
  e.address = "darshan college";
  e.phone_number = 12345789;
  e.salary = 934545;
  e.specialzation = "Flutter";

  Manager m = Manager();
  m.name = "Divyesh";
  m.age = 20;
  m.address = "Marvadi college";
  m.phone_number = 9874562;
  m.salary = 1022300;
  m.department = "Computer";

  print('>>> Employee Details <<<\n');
  print('Name: ${e.name}');
  print('Age: ${e.age}');
  print('Phone Number: ${e.phone_number}');
  print('Address: ${e.address}');
  print('Specialization: ${e.specialzation}');
  e.printSalary();
  print('>>> Manager Details <<<\n');
  print('Name: ${m.name}');
  print('Age: ${m.age}');
  print('Phone Number: ${m.phone_number}');
  print('Address: ${m.address}');
  print('Department: ${m.department}');
  m.printSalary();
}
