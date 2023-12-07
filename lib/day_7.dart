import 'dart:io';

import 'package:collection/collection.dart';

Future<void> playDay7() async {
  final content = await File('input/day_7.txt').readAsLines();
  final hands = content.map(Hand.from).toList();
  hands.sort();

  final sum = hands.mapIndexed((i, e) => (i + 1) * e.bid).sum;
  print(sum);
}

class Hand implements Comparable<Hand> {
  final List<String> cards;
  final HandType type;
  final int bid;

  Hand({
    required this.cards,
    required this.type,
    required this.bid,
  });

  @override
  int compareTo(Hand other) {
    final typeComparator = Enum.compareByIndex(other.type, type);
    if (typeComparator != 0) {
      return typeComparator;
    }

    return other.cards.compareTo(cards);
  }

  static Hand from(String line) {
    final [cardsStr, bidStr] = line.split(' ');
    final cards = cardsStr.split('');
    final type = fromCards(cards);

    return Hand(
      cards: cards,
      type: type,
      bid: int.parse(bidStr),
    );
  }
}

HandType fromCards(List<String> cards) {
  final cardsSet =
      cards.groupListsBy((e) => e).map((k, v) => MapEntry(k, v.length));

  switch (cardsSet.length) {
    case 1:
      return HandType.fiveOfAKind;
    case 2:
      if (cardsSet.containsKey('J')) {
        return HandType.fiveOfAKind;
      }

      if (cardsSet.containsValue(2)) {
        return HandType.fullHouse;
      }

      return HandType.fourOfAKind;
    case 3:
      if (cardsSet.containsValue(3)) {
        if (cardsSet.containsKey('J')) {
          return HandType.fourOfAKind;
        }

        return HandType.threeOfAKind;
      }

      if (cardsSet.containsValue(2) && cardsSet.containsKey('J')) {
        if (cardsSet['J'] == 2) {
          return HandType.fourOfAKind;
        }

        return HandType.fullHouse;
      }

      return HandType.twoPair;
    case 4:
      if (cardsSet.containsKey('J')) {
        return HandType.threeOfAKind;
      }

      return HandType.onePair;
    case 5:
    default:
      if (cardsSet.containsKey('J')) {
        return HandType.onePair;
      }

      return HandType.highCard;
  }
}

enum HandType {
  fiveOfAKind,
  fourOfAKind,
  fullHouse,
  threeOfAKind,
  twoPair,
  onePair,
  highCard;
}

final cardOrders = [
  'A',
  'K',
  'Q',
  'T',
  '9',
  '8',
  '7',
  '6',
  '5',
  '4',
  '3',
  '2',
  'J'
];

extension StringListExtension on List<String> {
  int compareTo(List<String> other) {
    for (var i = 0; i < length; i++) {
      if (this[i] != other[i]) {
        return cardOrders.indexOf(this[i]) > cardOrders.indexOf(other[i])
            ? 1
            : -1;
      }
    }

    return 0;
  }
}
