// WAP to create class Animal that has a method called animalSound() Subclass of Animals is cat
// it has its own implementation of an animal sound.

void main() {
  Cat kitty = Cat();
  kitty.AnimalSound();
}

class Animal {
  void AnimalSound() {
    print("This is a animal sound method!");
  }
}

class Cat extends Animal {
  AnimalSound() {
    print("miyauuuuu");
  }
}
