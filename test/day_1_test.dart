import 'package:aoc_2023/day_1.dart';
import 'package:test/test.dart';

void main() {
  group('day_1', () {
    group('readCalibrationValue', () {
      test('should return 12 when passing "1abc2"', () {
        expect(readCalibrationValue('1abc2'), equals(12));
      });

      test('should return 38 when passing "pqr3stu8vwx"', () {
        expect(readCalibrationValue('pqr3stu8vwx'), equals(38));
      });

      test('should return 15 when passing "a1b2c3d4e5f"', () {
        expect(readCalibrationValue('a1b2c3d4e5f'), equals(15));
      });

      test('should return 77 when passing "treb7uchet"', () {
        expect(readCalibrationValue('treb7uchet'), equals(77));
      });

      test('should return 21 when passing "twone"', () {
        expect(readCalibrationValue('twone'), equals(21));
      });

      test('should return 29 when passing "two1nine"', () {
        expect(readCalibrationValue('two1nine'), equals(29));
      });

      test('should return 83 when passing "eightwothree"', () {
        expect(readCalibrationValue('eightwothree'), equals(83));
      });

      test('should return 42 when passing "4nineeightseven2"', () {
        expect(readCalibrationValue('4nineeightseven2'), equals(42));
      });

      test('should return 14 when passing "zoneight234"', () {
        expect(readCalibrationValue('zoneight234'), equals(14));
      });

      test('should return 76 when passing "7pqrstsixteen"', () {
        expect(readCalibrationValue('7pqrstsixteen'), equals(76));
      });
    });
  });
}
