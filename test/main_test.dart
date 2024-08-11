import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_puzzle/widgets/crossword_generator_app.dart';

void main() {
  testWidgets('Crossword Generator App launches correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          title: 'Crossword Builder',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.blueGrey,
            brightness: Brightness.light,
          ),
          home: CrosswordGeneratorApp(),
        ),
      ),
    );

    // Verify if CrosswordGeneratorApp is present in the widget tree
    expect(find.byType(CrosswordGeneratorApp), findsOneWidget);

    // Verify the app title
    expect(find.text('Crossword Builder'), findsNothing);  
  });
}
