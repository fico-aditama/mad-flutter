import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_flutter/main.dart';
import 'package:mad_flutter/main_screen.dart';

void main() {
  testWidgets('MyApp initializes and displays MainScreen', (WidgetTester tester) async {
    // Build the MyApp widget and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that MainScreen is displayed
    expect(find.byType(MainScreen), findsOneWidget);
  });

  testWidgets('MaterialApp has correct title', (WidgetTester tester) async {
    // Build the MyApp widget and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that the title of MaterialApp is 'Wisata Bandung'
    final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
    expect(materialApp.title, 'Wisata Bandung');
  });
}
