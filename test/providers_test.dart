import 'package:flutter_test/flutter_test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:mad_puzzle/model.dart'; // Adjust import to match your file structure
import 'package:mad_puzzle/utils.dart';
import 'package:mad_puzzle/isolates.dart';

void main() {
  group('exploreCrosswordSolutions', () {
    test('should generate crossword solutions', () async {
      // Mock input data
      final crossword = Crossword.crossword(width: 5, height: 5);
      final wordList = BuiltSet<String>(['apple', 'orange', 'banana']);

      // Create the stream
      final stream = exploreCrosswordSolutions(
        crossword: crossword,
        wordList: wordList,
      );

      // Listen to the stream
      final workQueueList = await stream.toList();

      // Validate that solutions are generated and returned
      expect(workQueueList.isNotEmpty, true);
      expect(workQueueList.first.crossword.width, 5);
      expect(workQueueList.first.crossword.height, 5);
    });
  });
}
