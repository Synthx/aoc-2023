import 'dart:io';

Future<void> playDay6() async {
  final content = await File('input/day_6.txt').readAsLines();
  final spaceRegexp = RegExp('\\s+');
  final [time, record] = content
      .map((e) => int.parse(e.split(':')[1].trim().replaceAll(spaceRegexp, '')))
      .toList();

  final possibilities = calculatePossibleWay(time, record);
  print(possibilities);
}

int calculatePossibleWay(int time, int record) {
  var possibilities = 0;
  for (var i = 1; i < time - 1; i++) {
    final ranDistance = (time - i) * i;
    if (ranDistance > record) {
      possibilities += 1;
    }
  }

  return possibilities;
}
