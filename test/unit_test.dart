import 'package:flutter_test/flutter_test.dart';
import 'package:mad_flutter/utils.dart';

void main() {
  test('calculateDistance function calculates distance correctly', () {
    // Arrange
    final num x1 = 0;
    final num y1 = 0;
    final num x2 = 3;
    final num y2 = 4;

    // Act
    final result = calculateDistance(x1, y1, x2, y2);

    // Assert
    expect(result, equals(5));
  });
}
