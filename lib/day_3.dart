import 'dart:io';

import 'package:collection/collection.dart';

Future<void> playDay3() async {
  final content = await File('input/day_3.txt').readAsLines();
  List<Gear> gears = [];
  List<Number> numbers = [];

  final numberRegexp = RegExp(r'([0-9]+)');
  final gearRegexp = RegExp(r'(\*)');

  // first retrieve all gear & number position
  for (var i = 0; i < content.length; i++) {
    final line = content[i];
    numbers.addAll(numberRegexp.allMatches(line).map((e) => Number.from(i, e)));
    gears.addAll(gearRegexp.allMatches(line).map((e) => Gear.from(i, e)));
  }

  final sum = gears.map((e) => e.getRatio(numbers)).sum;
  print(sum);
}

class Number {
  final int value;
  final int lineIndex;
  final int startCharIndex;
  final int endCharIndex;

  Number({
    required this.value,
    required this.lineIndex,
    required this.startCharIndex,
    required this.endCharIndex,
  });

  static Number from(int index, RegExpMatch match) {
    return Number(
      value: int.parse(match[0]!),
      lineIndex: index,
      startCharIndex: match.start,
      endCharIndex: match.end - 1,
    );
  }
}

class Gear {
  final int lineIndex;
  final int charIndex;

  Gear({
    required this.lineIndex,
    required this.charIndex,
  });

  int getRatio(List<Number> numbers) {
    Iterable<Number> candidateNumbers = numbers.where((e) {
      bool isInLineRange =
          e.lineIndex >= lineIndex - 1 && e.lineIndex <= lineIndex + 1;
      bool isInCharRange = (e.startCharIndex >= charIndex - 1 &&
              e.startCharIndex <= charIndex + 1) ||
          (e.endCharIndex >= charIndex - 1 && e.endCharIndex <= charIndex + 1);

      return isInLineRange && isInCharRange;
    });
    if (candidateNumbers.length < 2) {
      return 0;
    }

    return candidateNumbers
        .map((e) => e.value)
        .fold(1, (acc, curr) => acc * curr);
  }

  static Gear from(int line, RegExpMatch match) {
    return Gear(
      lineIndex: line,
      charIndex: match.start,
    );
  }
}
