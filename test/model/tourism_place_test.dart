// test/model/tourism_place_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mad_flutter/model/tourism_place.dart';

void main() {
  group('TourismPlace', () {
    test('should correctly initialize properties', () {
      // Arrange
      final name = 'Farm House Lembang';
      final location = 'Lembang';
      final description =
          'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.';
      final openDays = 'Open Everyday';
      final openTime = '09:00 - 20:00';
      final ticketPrice = 'Rp 25000';
      final imageAsset = 'images/farm-house.jpg';
      final imageUrls = [
        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
      ];

      // Act
      final tourismPlace = TourismPlace(
        name: name,
        location: location,
        description: description,
        openDays: openDays,
        openTime: openTime,
        ticketPrice: ticketPrice,
        imageAsset: imageAsset,
        imageUrls: imageUrls,
      );

      // Assert
      expect(tourismPlace.name, name);
      expect(tourismPlace.location, location);
      expect(tourismPlace.description, description);
      expect(tourismPlace.openDays, openDays);
      expect(tourismPlace.openTime, openTime);
      expect(tourismPlace.ticketPrice, ticketPrice);
      expect(tourismPlace.imageAsset, imageAsset);
      expect(tourismPlace.imageUrls, imageUrls);
    });
  });
}
