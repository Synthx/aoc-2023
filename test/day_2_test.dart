import 'package:aoc_2023/day_2.dart';
import 'package:test/test.dart';

void main() {
  group('day_2', () {
    group('Game', () {
      group('from', () {
        test('should return Game instance', () {
          final game = Game.from(
            1,
            'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
          );

          expect(game.id, equals(1));
          expect(game.sets.length, equals(3));
        });
      });

      group('isPossibleWith', () {
        final GameSet loadedSet = {
          'red': 12,
          'green': 13,
          'blue': 14,
        };

        test('should return true if all games have fewer corresponding cubes',
            () {
          final game = Game.from(
            1,
            'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
          );

          expect(game.isPossibleWith(loadedSet), equals(true));
        });

        test('should return false otherwise', () {
          final game = Game.from(
            1,
            'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
          );

          expect(game.isPossibleWith(loadedSet), equals(false));
        });
      });

      group('getPower', () {
        test(
            'should return the multiplied minimum numbers of cube to make the game possible',
            () {
          final game = Game.from(
            1,
            'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green',
          );

          expect(game.getPower(), equals(48));

          final game2 = Game.from(
            1,
            'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red',
          );

          expect(game2.getPower(), equals(630));
        });
      });
    });
  });
}
