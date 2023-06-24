// Write a program to insert objects in List<dynamic> using function and display it using
// function. (Name, Age, Hobby).

class Person {
  String name;
  int age;
  String hobby;

  Person(this.name, this.age, this.hobby);
}

void insertPerson(List<dynamic> persons, String name, int age, String hobby) {
  Person person = Person(name, age, hobby);
  persons.add(person);
}

void displayPersons(List<dynamic> persons) {
  print("List of Persons:");
  for (var person in persons) {
    print("Name: ${person.name}, Age: ${person.age}, Hobby: ${person.hobby}");
  }
}

void main() {
  List<dynamic> persons = [];

  // Inserting persons into the list
  insertPerson(persons, "Kishan", 25, "Cricket");
  insertPerson(persons, "Karan", 30, "Reading");
  insertPerson(persons, "Uttam", 22, "Painting");

  // Displaying the list of persons
  displayPersons(persons);
}
