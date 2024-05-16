void printCustomSequence(List<int> a) {
  int currentIndex = 0;
  for (int i = 0; i < a.length; i++) {
    print(a[currentIndex]);
    currentIndex += i + 1;
    if (i >= 2) {
      break;
    }
  }
}

void main() {
  List<int> numbers = [3, 5, 8, 9, 12, 34, 67, 22, 56];
  printCustomSequence(numbers);
}
