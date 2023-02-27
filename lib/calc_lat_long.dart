library calc_lat_long;

import 'dart:math';

import 'UnitLengthEnum.dart';
export 'UnitLengthEnum.dart';

class CalcDistance {
  static double distance(double lat1, double lat2, double lon1, double lon2,
      UnitLength unitLength) {
    if ((lat1 == lat2) && (lon1 == lon2)) {
      return 0;
    } else {
      double converterFactor;

      switch (unitLength) {
        case UnitLength.km:
          converterFactor = 1.0 / 1000.0;
          break;
        case UnitLength.mi:
          converterFactor = 1.0 / 1609.34;
          break;
        case UnitLength.nm:
          converterFactor = 1.0 / 1852.0;
          break;
        default:
          converterFactor = 1.0;
          break;
      }

      const earthRadius = 6371000;

      final lat1Rad = radians(lat1);
      final lon1Rad = radians(lon1);
      final lat2Rad = radians(lat2);
      final lon2Rad = radians(lon2);

      final deltaLat = lat2Rad - lat1Rad;
      final deltaLon = lon2Rad - lon1Rad;

      final a = sin(deltaLat / 2) * sin(deltaLat / 2) +
          cos(lat1Rad) * cos(lat2Rad) * sin(deltaLon / 2) * sin(deltaLon / 2);

      final c = 2 * atan2(sqrt(a), sqrt(1 - a));

      final distance = earthRadius * c * converterFactor;

      return distance;
    }
  }

  static double radians(double degrees) {
    final double pi = 3.14159265358979323846;
    return degrees * pi / 180.0;
  }
}
