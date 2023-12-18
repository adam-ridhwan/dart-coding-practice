import 'dart:io';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  var filePath = p.join(Directory.current.path, 'bin', 'text.txt');
  File file = File(filePath);
  var fileContent = file.readAsLinesSync();

  Map possibleBag = Map.unmodifiable({'red': 12, 'green': 13, 'blue': 14});

  Map<int, List<Map<String, int>>> gameResults = {};

  for (var line in fileContent) {
    var parts = line.split(':');
    if (parts.length != 2) continue;

    int gameId = int.tryParse(parts[0].split(' ').last) ?? 0;
    var cubeSets = parts[1].split(';');

    List<Map<String, int>> roundResults = [];
    for (var set in cubeSets) {
      roundResults.add(_parseColorCount(set));
    }

    gameResults[gameId] = roundResults;
  }

  // Print the game results
  gameResults.forEach((gameId, rounds) {
    print('Game $gameId:');
    for (var round in rounds) {
      print(round);
    }
    print('\n');
  });
}

Map<String, int> _parseColorCount(String data) {
  Map<String, int> colorCountMap = {};
  var colorCounts = data.trim().split(',');

  for (var colorCount in colorCounts) {
    var parts = colorCount.trim().split(' ');
    if (parts.length != 2) continue;

    int count = int.tryParse(parts[0]) ?? 0;
    String color = parts[1];
    colorCountMap[color] = count;
  }

  return colorCountMap;
}
