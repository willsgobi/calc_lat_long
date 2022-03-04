library calc_lat_long;

import 'dart:math' as math;

import 'UnitLengthEnum.dart';

export 'UnitLengthEnum.dart';

class CalcDistance {
  static distance(double lat1, double lat2, double lon1, double lon2,
      UnitLength unitLength) {
    if ((lat1 == lat2) && (lon1 == lon2)) {
      return 0;
    } else {
      var radLat1 = math.pi * lat1 / 180;
      var radLat2 = math.pi * lat2 / 180;
      var theta = lon1 - lon2;
      var radTheta = math.pi * theta / 180;
      var dist = math.sin(radLat1) * math.sin(radLat2) +
          math.cos(radLat1) * math.cos(radLat2) * math.cos(radTheta);

      if (dist > 1) {
        dist = 1;
      }

      dist = math.acos(dist);
      dist = dist * 180 / math.pi;
      dist = dist * 60 * 1.1515;

      if (unitLength == UnitLength.km) {
        dist = (dist * 1.609344);
      }

      if (unitLength == UnitLength.nm) {
        dist = (dist * 0.8684);
      }

      return double.parse(dist.toStringAsFixed(2));
    }
  }
}
