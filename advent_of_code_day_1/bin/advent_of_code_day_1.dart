import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  var filePath = p.join(Directory.current.path, 'bin', 'text.txt');
  File file = File(filePath);

  var fileContent = file.readAsStringSync();

  print(fileContent);
}
