import 'package:flutter_test/flutter_test.dart';

import 'package:calc_lat_long/calc_lat_long.dart';

void main() {
  test('Check distance of two coordinates', () {
    final distance = CalcDistance.distance(
        double.parse('41.600097'),
        double.parse('41.60428'),
        double.parse('-93.62959'),
        double.parse('-93.64298'),
        UnitLength.km);
    expect(distance, 1.20);
  });
}
