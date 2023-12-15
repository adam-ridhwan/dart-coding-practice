import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  var filePath = p.join(Directory.current.path, 'bin', 'text.txt');

  File file = File(filePath);

  var fileContent = file.readAsLinesSync();

  int sum = 0;

  var result = fileContent.map((string) {
    String? firstDigit;
    String? lastDigit;

    for (var char in string.split('')) {
      if (RegExp(r'\d').hasMatch(char)) {
        lastDigit = char;
        firstDigit ??= char;
      }
    }

    return (firstDigit ?? '') + (lastDigit ?? '');
  }).toList();

  for (var numString in result) {
    if (numString.isNotEmpty) {
      sum += int.parse(numString);
    }
  }

  print(sum);
}
