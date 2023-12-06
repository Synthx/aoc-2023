import 'package:aoc_2023/day_5.dart';
import 'package:test/test.dart';

void main() {
  group('day_5', () {
    group('calculateDestinationFrom', () {
      final List<CalculationRange> ranges = [
        CalculationRange.from('50 98 2'),
        CalculationRange.from('52 50 48'),
      ];

      test('should return mapped destination', () {
        expect(calculateDestinationFrom(51, ranges), equals(53));
        expect(calculateDestinationFrom(96, ranges), equals(98));
        expect(calculateDestinationFrom(99, ranges), equals(51));
      });

      test('should return source if no mapped destination', () {
        expect(calculateDestinationFrom(8, ranges), equals(8));
        expect(calculateDestinationFrom(49, ranges), equals(49));
      });
    });
  });
}
