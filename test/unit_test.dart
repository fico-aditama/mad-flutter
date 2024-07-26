// test/utils_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mad_flutter/utils.dart'; // Make sure to adjust the import path as per your project structure

void main() {
  test('Factorial function calculates correctly for positive integers', () {
    // Arrange
    int input = 5;
    int expectedOutput = 120;

    // Act
    int result = factorial(input);

    // Assert
    expect(result, expectedOutput);
  });

  test('Factorial function calculates correctly for zero', () {
    // Arrange
    int input = 0;
    int expectedOutput = 1;

    // Act
    int result = factorial(input);

    // Assert
    expect(result, expectedOutput);
  });

  test('Factorial function calculates correctly for one', () {
    // Arrange
    int input = 1;
    int expectedOutput = 1;

    // Act
    int result = factorial(input);

    // Assert
    expect(result, expectedOutput);
  });

  test('Factorial function calculates correctly for large numbers', () {
    // Arrange
    int input = 10;
    int expectedOutput = 3628800;

    // Act
    int result = factorial(input);

    // Assert
    expect(result, expectedOutput);
  });
}
