import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_flutter/view/main_screen.dart';
import 'package:mad_flutter/view/detail_screen.dart';
import 'package:mad_flutter/model/tourism_place.dart';

void main() {
  // Mock data for TourismPlace
  const mockTourismPlace = TourismPlace(
    name: 'Test Place',
    imageAsset: 'assets/test_image.jpg',
    openDays: 'Monday - Friday',
    openTime: '09:00 AM - 05:00 PM',
    ticketPrice: '\$20',
    description: 'A test description.',
    imageUrls: [
      'https://via.placeholder.com/150',
      'https://via.placeholder.com/150',
    ],
  );

  testWidgets('MainScreen displays TourismPlaceList on small screens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MainScreen(),
    ));

    // Set to a small size
    tester.binding.window.physicalSizeTestValue = Size(400, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpAndSettle();

    // Verify TourismPlaceList is displayed
    expect(find.byType(TourismPlaceList), findsOneWidget);
  });

  testWidgets('MainScreen displays TourismPlaceGrid with gridCount 4 on medium screens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MainScreen(),
    ));

    // Set to a medium size
    tester.binding.window.physicalSizeTestValue = Size(800, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpAndSettle();

    // Verify TourismPlaceGrid with gridCount 4 is displayed
    expect(find.byType(TourismPlaceGrid), findsOneWidget);
    final gridCountFinder = find.byWidgetPredicate(
      (widget) => widget is TourismPlaceGrid && widget.gridCount == 4,
    );
    expect(gridCountFinder, findsOneWidget);
  });

  testWidgets('MainScreen displays TourismPlaceGrid with gridCount 6 on large screens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MainScreen(),
    ));

    // Set to a large size
    tester.binding.window.physicalSizeTestValue = Size(1300, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpAndSettle();

    // Verify TourismPlaceGrid with gridCount 6 is displayed
    expect(find.byType(TourismPlaceGrid), findsOneWidget);
    final gridCountFinder = find.byWidgetPredicate(
      (widget) => widget is TourismPlaceGrid && widget.gridCount == 6,
    );
    expect(gridCountFinder, findsOneWidget);
  });

  testWidgets('Navigation to DetailScreen works on tap in TourismPlaceGrid', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MainScreen(),
    ));

    // Set to a medium size
    tester.binding.window.physicalSizeTestValue = Size(800, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpAndSettle();

    // Tap on the first item in the grid
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();

    // Verify navigation to DetailScreen
    expect(find.byType(DetailScreen), findsOneWidget);
  });

  testWidgets('Navigation to DetailScreen works on tap in TourismPlaceList', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MainScreen(),
    ));

    // Set to a small size
    tester.binding.window.physicalSizeTestValue = Size(400, 800);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpAndSettle();

    // Tap on the first item in the list
    await tester.tap(find.byType(InkWell).first);
    await tester.pumpAndSettle();

    // Verify navigation to DetailScreen
    expect(find.byType(DetailScreen), findsOneWidget);
  });
}
