import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/scheduler.dart';

import 'package:mad_puzzle/widgets/ticker_builder.dart'; 

void main() {
  testWidgets('TickerBuilder triggers rebuilds on every tick', (WidgetTester tester) async {
    // Arrange
    int rebuildCount = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: TickerBuilder(
          builder: (context) {
            rebuildCount++;
            return const SizedBox();
          },
        ),
      ),
    );

    // Act
    await tester.pump(); // Simulate a frame

    // Assert
    expect(rebuildCount, greaterThan(1));
  });
}
