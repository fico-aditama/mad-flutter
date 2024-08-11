import 'package:test/test.dart';
import 'package:built_collection/built_collection.dart';
import '../lib/model.dart'; 

void main() {
  group('Location Tests', () {
    test('Location moves correctly', () {
      final location = Location.at(2, 3);

      expect(location.left.x, equals(1));
      expect(location.right.x, equals(3));
      expect(location.up.y, equals(2));
      expect(location.down.y, equals(4));
    });

    test('Location offsets correctly', () {
      final location = Location.at(5, 5);

      expect(location.leftOffset(3).x, equals(2));
      expect(location.rightOffset(2).x, equals(7));
      expect(location.upOffset(1).y, equals(4));
      expect(location.downOffset(4).y, equals(9));
    });

    test('Location pretty print', () {
      final location = Location.at(1, 2);

      expect(location.prettyPrint(), equals('(1,2)'));
    });
  });

  group('CrosswordWord Tests', () {
    test('CrosswordWord creation and properties', () {
      final location = Location.at(0, 0);
      final word = CrosswordWord.word(
        word: 'TEST',
        location: location,
        direction: Direction.across,
      );

      expect(word.word, equals('TEST'));
      expect(word.location, equals(location));
      expect(word.direction, equals(Direction.across));
    });
  });

  group('Crossword Tests', () {
    test('Crossword creation and word addition', () {
      final crossword = Crossword.crossword(width: 5, height: 5);

      final word = 'TEST';
      final location = Location.at(0, 0);

      final updatedCrossword = crossword.addWord(
        location: location,
        word: word,
        direction: Direction.across,
      );

      expect(updatedCrossword?.words.length, equals(1));
      expect(updatedCrossword?.words.first.word, equals(word));
    });

    test('Invalid word addition does not update crossword', () {
      final crossword = Crossword.crossword(width: 5, height: 5);

      final invalidWord = 'INVALID';
      final location = Location.at(0, 0);

      final updatedCrossword = crossword.addWord(
        location: location,
        word: invalidWord,
        direction: Direction.across,
      );

      expect(updatedCrossword, isNull);
    });

    test('Crossword pretty print', () {
      final crossword = Crossword.crossword(width: 5, height: 5);
      final updatedCrossword = crossword?.addWord(
        location: Location.at(0, 0),
        word: 'TEST',
        direction: Direction.across,
      );

      expect(updatedCrossword?.prettyPrintCrossword(), contains('TEST'));
    });
  });

  group('WorkQueue Tests', () {
    test('WorkQueue creation and properties', () {
      final crossword = Crossword.crossword(width: 5, height: 5);
      final workQueue = WorkQueue.from(
        crossword: crossword,
        candidateWords: ['TEST', 'WORD'],
        startLocation: Location.at(0, 0),
      );

      expect(workQueue.crossword, equals(crossword));
      expect(workQueue.candidateWords.length, equals(2));
      expect(workQueue.locationsToTry.length, equals(1));
    });

    test('WorkQueue isCompleted flag', () {
      final crossword = Crossword.crossword(width: 5, height: 5);
      final workQueue = WorkQueue.from(
        crossword: crossword,
        candidateWords: ['TEST', 'WORD'],
        startLocation: Location.at(0, 0),
      );

      expect(workQueue.isCompleted, isFalse);
    });
  });
}
