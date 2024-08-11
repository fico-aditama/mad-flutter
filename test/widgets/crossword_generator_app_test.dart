import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_puzzle/widgets/crossword_generator_app.dart'; // Adjust import as per your project structure
import 'package:mad_puzzle/providers.dart';
import 'package:mad_puzzle/widgets/crossword_widget.dart';

void main() {
  testWidgets('CrosswordGeneratorApp renders correctly', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: CrosswordGeneratorApp(),
        ),
      ),
    );

    // Verify that the AppBar is displayed with the correct title
    expect(find.text('Crossword Generator'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the CrosswordWidget is displayed
    expect(find.byType(CrosswordWidget), findsOneWidget);

    // Verify that the settings IconButton is displayed in the AppBar
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Tap on the settings IconButton
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that the menu with CrosswordSize options is displayed
    for (final entry in CrosswordSize.values) {
      expect(find.text(entry.label), findsOneWidget);
    }

    // Tap on a CrosswordSize option and verify it was selected
    await tester.tap(find.text(CrosswordSize.large.label));
    await tester.pump();

    // Verify that the correct CrosswordSize was selected
    final selectedSizeIcon = find.byIcon(Icons.radio_button_checked_outlined);
    expect(selectedSizeIcon, findsOneWidget);
    expect(find.text(CrosswordSize.large.label), findsOneWidget);
  });
}
