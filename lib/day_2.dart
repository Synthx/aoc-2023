import 'dart:io';

import 'package:collection/collection.dart';

typedef GameSet = Map<String, int>;

Future<void> playDay2() async {
  final content = await File('input/day_2.txt').readAsLines();
  final sum = content
      .mapIndexed((i, e) => Game.from(i + 1, e))
      .map((e) => e.getPower())
      .sum;

  print(sum);
}

class Game {
  final int id;
  final List<GameSet> sets;

  Game({
    required this.id,
    required this.sets,
  });

  int getPower() {
    GameSet minimumSet = {};
    for (final set in sets) {
      for (var entry in set.entries) {
        final minimumValue = minimumSet[entry.key];
        if (minimumValue == null || entry.value > minimumValue) {
          minimumSet[entry.key] = entry.value;
        }
      }
    }

    return minimumSet.values.fold(1, (acc, curr) => acc * curr);
  }

  bool isPossibleWith(GameSet loadedSet) {
    return sets.every((e) => e.entries.every((entry) {
          final loadedValue = loadedSet[entry.key];
          if (loadedValue == null) {
            return true;
          }

          return entry.value <= loadedValue;
        }));
  }

  static Game from(int index, String line) {
    final sets =
        line.split(':')[1].split(';').map(_getSetFrom).toList(growable: false);

    return Game(
      id: index,
      sets: sets,
    );
  }
}

GameSet _getSetFrom(String line) {
  GameSet set = {};
  for (final e in line.split(',')) {
    final [value, color] = e.trim().split(' ');
    set[color] = int.parse(value);
  }

  return set;
}
