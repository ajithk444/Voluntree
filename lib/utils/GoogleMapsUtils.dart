import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsUtils {
  static List<LatLng> decodePolyline(String encodedPolyline) {
    List<LatLng> poly = [];
    int index = 0;
    int length = encodedPolyline.length;
    int lat = 0;
    int lng = 0;

    while (index < length) {
      int b, shift = 0, result = 0;
      do {
        b = encodedPolyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dLat;

      shift = 0;
      result = 0;
      do {
        b = encodedPolyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dLng;

      LatLng p = new LatLng(((lat / 1E5)), ((lng / 1E5)));
      poly.add(p);
    }
    return poly;
  }

  static LatLngBounds addLatitudeOffset({LatLngBounds to}) {
    final offsetSouthwest = LatLng(1.5*to.southwest.latitude - 0.5*to.northeast.latitude - 0.001, to.southwest.longitude);
    return LatLngBounds(southwest: offsetSouthwest, northeast: to.northeast);
  }
}