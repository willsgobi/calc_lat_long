import 'package:flutter_test/flutter_test.dart';

import 'package:calc_lat_long/calc_lat_long.dart';

void main() {
  test('Check distance of two coordinates', () {
    final distance = CalcDistance.distance(
        num.parse('41.600097'),
        num.parse('41.60428'),
        num.parse('-93.62959'),
        num.parse('-93.64298'),
        UnitLength.km);
    expect(distance, 1.21);
  });
}
