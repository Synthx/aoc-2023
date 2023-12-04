import 'dart:io';

import 'package:collection/collection.dart';

final spaceRegexp = RegExp('\\s+');

Future<void> playDay4() async {
  final content = await File('input/day_4.txt').readAsLines();
  final cards = content.map(Card.from).toList(growable: false);
  Map<int, int> copies = cards.foldIndexed({}, (i, acc, _) {
    acc[i] = 1;
    return acc;
  });

  for (var i = 0; i < cards.length; i++) {
    final matchingNumbers = cards[i].getMatchingNumbers();
    if (matchingNumbers == 0) {
      continue;
    }

    int startIndex = i + 1;
    int endCardIndex = startIndex + matchingNumbers - 1;
    if (endCardIndex > cards.length - 1) {
      endCardIndex = cards.length - 1;
    }

    for (var j = startIndex; j <= endCardIndex; j++) {
      copies[j] = copies[j]! + copies[i]!;
    }
  }

  print(copies.values.sum);
}

class Card {
  final Iterable<int> numbers;
  final Iterable<int> winningNumbers;

  Card({
    required this.numbers,
    required this.winningNumbers,
  });

  int getMatchingNumbers() {
    return numbers.where((e) => winningNumbers.contains(e)).length;
  }

  static Card from(String line) {
    final [winningNumbersStr, numbersStr] = line.split(':')[1].split('|');

    return Card(
      numbers: numbersStr
          .trim()
          .replaceAll(spaceRegexp, ' ')
          .split(' ')
          .map(int.parse),
      winningNumbers: winningNumbersStr
          .trim()
          .replaceAll(spaceRegexp, ' ')
          .split(' ')
          .map(int.parse),
    );
  }
}
