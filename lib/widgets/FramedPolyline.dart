import 'package:google_maps_flutter/google_maps_flutter.dart';

class FramedPolyline {
  final Polyline polyline;
  final LatLngBounds bounds;

  FramedPolyline({this.polyline, this.bounds});
}