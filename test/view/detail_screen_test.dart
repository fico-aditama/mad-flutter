import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_flutter/model/tourism_place.dart';
import 'package:mad_flutter/detail_screen.dart';

void main() {
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

  testWidgets('DetailScreen displays DetailMobilePage on small screens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: DetailScreen(place: mockTourismPlace),
    ));

    // Verify DetailMobilePage is displayed
    expect(find.byType(DetailMobilePage), findsOneWidget);
    expect(find.text('Test Place'), findsOneWidget);
  });

  testWidgets('DetailScreen displays DetailWebPage on large screens', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1200, 800); // Set to a large size
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(MaterialApp(
      home: DetailScreen(place: mockTourismPlace),
    ));

    // Verify DetailWebPage is displayed
    expect(find.byType(DetailWebPage), findsOneWidget);
    expect(find.text('Test Place'), findsOneWidget);
  });

  testWidgets('FavoriteButton toggles state when pressed', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FavoriteButton(),
      ),
    ));

    final favoriteButton = find.byType(FavoriteButton);
    expect(favoriteButton, findsOneWidget);

    // Initial state should be not favorite
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(favoriteButton);
    await tester.pump();

    // State should toggle to favorite
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
