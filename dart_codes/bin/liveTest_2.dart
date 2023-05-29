import 'dart:io';
main() {

  print("enter a list of numbers: ");
  String input = stdin.readLineSync()!;
  List<int> numbers = input.split(" ").map(int.parse).toList();

  print("Input list: $numbers");
  List<int> oddNumbers = getOddNumbers(numbers);
  print("Output list: $oddNumbers");
}

List<int> getOddNumbers(List<int> numbers) {
  List<int> oddNumbers = [];
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 != 0) {
      oddNumbers.add(numbers[i]);
    }
  }
  return oddNumbers;
}

