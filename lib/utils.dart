import 'dart:math';

num calculateDistance(num x1, num y1, num x2, num y2) {
  return sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
}
