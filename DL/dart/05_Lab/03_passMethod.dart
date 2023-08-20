// Wap to pass method as an argument to another class.

void main(List<String> args) {
  print(numberProcess(square, 5));
}

int numberProcess(Function func, int n) {
  return func(n);
}

int square(int x) {
  return x * x;
}
