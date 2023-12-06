import 'dart:io';

import 'package:collection/collection.dart';

Future<void> playDay5() async {
  final content = await File('input/day_5.txt').readAsString();
  final [
    seedsStr,
    soilStr,
    fertilizerStr,
    waterStr,
    lightStr,
    temperatureStr,
    humidityStr,
    locationStr
  ] = content.split('\n\n');

  final seedRanges =
      seedsStr.split(':')[1].trim().split(' ').map(int.parse).slices(2);

  final soilRanges = rangesFrom(soilStr);
  final fertilizerRanges = rangesFrom(fertilizerStr);
  final waterRanges = rangesFrom(waterStr);
  final lightRanges = rangesFrom(lightStr);
  final temperatureRanges = rangesFrom(temperatureStr);
  final humidityRanges = rangesFrom(humidityStr);
  final locationRanges = rangesFrom(locationStr);

  int? minimumLocation;
  for (final range in seedRanges) {
    final [start, length] = range;
    print('range from $start to ${start + length}');

    for (var seed = start; seed < start + length; seed++) {
      print('processing seed $seed');

      final soil = calculateDestinationFrom(seed, soilRanges);
      final fertilizer = calculateDestinationFrom(soil, fertilizerRanges);
      final water = calculateDestinationFrom(fertilizer, waterRanges);
      final light = calculateDestinationFrom(water, lightRanges);
      final temperature = calculateDestinationFrom(light, temperatureRanges);
      final humidity = calculateDestinationFrom(temperature, humidityRanges);
      final location = calculateDestinationFrom(humidity, locationRanges);

      if (minimumLocation == null || location < minimumLocation) {
        minimumLocation = location;
      }
    }
  }

  print(minimumLocation);
}

Iterable<CalculationRange> rangesFrom(String line) {
  return line.split(':\n')[1].split('\n').map(CalculationRange.from);
}

int calculateDestinationFrom(int source, Iterable<CalculationRange> ranges) {
  final range = ranges.firstWhereOrNull(
      (e) => source >= e.source && source < e.source + e.length);
  if (range == null) {
    return source;
  }

  return source - range.source + range.destination;
}

class CalculationRange {
  final int destination;
  final int source;
  final int length;

  CalculationRange({
    required this.destination,
    required this.source,
    required this.length,
  });

  static CalculationRange from(String line) {
    final [destination, range, length] = line.trim().split(' ');

    return CalculationRange(
      destination: int.parse(destination),
      source: int.parse(range),
      length: int.parse(length),
    );
  }
}
