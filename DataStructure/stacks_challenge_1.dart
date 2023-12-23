void main() {
  List<int> numbers = [13, 21, 37, 40, 53];
  List<String> strings = ['reem', 'heba', 'lama'];

  print("Reversed numbers:");
  reverseList(numbers);

  print("\nReversed strings:");
  reverseList(strings);
}

void reverseList(List<dynamic> list) {
  for (int i = list.length - 1; i >= 0; i--) {
    print(list[i]);
  }
}
