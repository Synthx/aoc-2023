import 'dart:io';

import 'package:collection/collection.dart';

final Map<String, String> _str2num = {
  'one': 'o1e',
  'two': 't2o',
  'three': 't3e',
  'four': 'f4r',
  'five': 'f5e',
  'six': 's6x',
  'seven': 's7n',
  'eight': 'e8t',
  'nine': 'n9e',
};

Future<void> playDay1() async {
  final content = await File('input/day_1.txt').readAsLines();
  final sum = content.map(readCalibrationValue).sum;

  print(sum);
}

int readCalibrationValue(String line) {
  for (final entry in _str2num.entries) {
    line = line.replaceAll(entry.key, entry.value);
  }

  final digits = RegExp(r'([1-9])')
      .allMatches(line)
      .map((e) => int.parse(e[0]!))
      .toList(growable: false);

  return 10 * digits.first + digits.last;
}
