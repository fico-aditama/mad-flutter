import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_puzzle/widgets/crossword_widget.dart'; // Adjust the path as necessary
import 'package:mad_puzzle/providers.dart'; // Import your providers
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

void main() {
  testWidgets('CrosswordWidget displays correct grid and handles characters', (WidgetTester tester) async {
    // Mock the provider states
    final mockSize = Size(10, 10);
    final mockWorkQueueAsync = AsyncValue.data(
      WorkQueue(
        crossword: Crossword(
          characters: {
            Location.at(0, 0): CrosswordCharacter('A'),
            Location.at(1, 0): CrosswordCharacter('B'),
          },
        ),
        locationsToTry: {
          Location.at(0, 0): true,
          Location.at(1, 0): false,
        },
      ),
    );

    // Create a mock provider container
    final container = ProviderContainer(
      overrides: [
        sizeProvider.overrideWithValue(mockSize),
        workQueueProvider.overrideWithValue(mockWorkQueueAsync),
      ],
    );

    // Build the widget tree
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(
            body: CrosswordWidget(),
          ),
        ),
      ),
    );

    // Verify the grid size
    expect(find.byType(TableViewCell), findsNWidgets(100));

    // Verify specific cells
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
  });
}
