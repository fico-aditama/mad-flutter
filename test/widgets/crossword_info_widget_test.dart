import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_puzzle/widgets/crossword_info_widget.dart'; 
import 'package:mad_puzzle/providers.dart'; 

void main() {
  testWidgets('CrosswordInfoWidget displays correct information', (WidgetTester tester) async {
    // Mock the provider states
    final mockSize = Size(10, 10);
    final mockDisplayInfo = DisplayInfo(
      wordsInGridCount: '5',
      candidateWordsCount: '10',
      locationsToExploreCount: '15',
      knownBadLocationsCount: '2',
      gridFilledPercentage: '80%',
    );
    final mockStartTime = DateTime.now();
    final mockEndTime = null;
    final mockRemainingTime = Duration(minutes: 10);

    // Create a mock provider container
    final container = ProviderContainer(
      overrides: [
        sizeProvider.overrideWithValue(mockSize),
        displayInfoProvider.overrideWithValue(mockDisplayInfo),
        startTimeProvider.overrideWithValue(mockStartTime),
        endTimeProvider.overrideWithValue(mockEndTime),
        expectedRemainingTimeProvider.overrideWithValue(mockRemainingTime),
      ],
    );

    // Build the widget tree
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(
            body: CrosswordInfoWidget(),
          ),
        ),
      ),
    );

    // Verify the displayed information
    expect(find.text('Grid Size 10 x 10'), findsOneWidget);
    expect(find.text('Words in grid 5'), findsOneWidget);
    expect(find.text('Candidate words 10'), findsOneWidget);
    expect(find.text('Locations to explore 15'), findsOneWidget);
    expect(find.text('Known bad locations 2'), findsOneWidget);
    expect(find.text('Grid filled 80%'), findsOneWidget);
    expect(find.text('Time elapsed'), findsOneWidget);
    expect(find.text('Est. remaining'), findsOneWidget);
  });
}
