// WAP to sort values in List<int>.
// Ex.
// Input : [13, 2, -11, 142, -389, 0]
// Result: [-389, -11, 0, 2, 13, 142]

void main(List<String> args) {
  List l1 = [13, 2, -11, 142, -389, 0];
  l1.sort();
  print(l1);

  // Menual Sorting
  for (int i = 0; i < l1.length - 1; i++) {
    for (int j = 0; j < l1.length - i - 1; j++) {
      if (l1[j] > l1[j + 1]) {
        int temp = l1[j];
        l1[j] = l1[j + 1];
        l1[j + 1] = temp;
      }
    }
  }

  print('Menual Sorting : $l1');
}
