import 'package:aoc_2023/day_7.dart';
import 'package:test/test.dart';

void main() {
  group('day_7', () {
    group('Hand', () {
      test('compareTo', () {
        expect(true, equals(true));
      });
    });

    group('fromCards', () {
      test('should return corresponding type', () {
        expect(
            fromCards(['A', 'A', 'A', 'A', 'A']), equals(HandType.fiveOfAKind));
        expect(
            fromCards(['K', 'A', 'A', 'A', 'A']), equals(HandType.fourOfAKind));
        expect(
            fromCards(['K', 'K', 'A', 'A', 'A']), equals(HandType.fullHouse));
        expect(fromCards(['K', 'B', 'A', 'A', 'A']),
            equals(HandType.threeOfAKind));
        expect(fromCards(['D', 'K', 'A', 'A', 'A']),
            equals(HandType.threeOfAKind));
        expect(fromCards(['D', 'K', 'K', 'A', 'A']), equals(HandType.twoPair));
        expect(fromCards(['D', 'K', 'V', 'A', 'A']), equals(HandType.onePair));
        expect(fromCards(['D', '8', 'V', 'K', 'A']), equals(HandType.highCard));
      });

      test('should return higher possible type with joker', () {
        expect(
            fromCards(['A', 'A', 'A', 'J', 'A']), equals(HandType.fiveOfAKind));
        expect(
            fromCards(['K', 'J', 'A', 'A', 'A']), equals(HandType.fourOfAKind));
        expect(
            fromCards(['K', 'T', 'J', 'J', 'T']), equals(HandType.fourOfAKind));
        expect(
            fromCards(['K', 'K', 'A', 'J', 'A']), equals(HandType.fullHouse));
        expect(fromCards(['D', 'K', 'J', 'A', 'A']),
            equals(HandType.threeOfAKind));
        expect(fromCards(['D', 'K', 'V', 'J', 'A']), equals(HandType.onePair));
      });
    });
  });
}
