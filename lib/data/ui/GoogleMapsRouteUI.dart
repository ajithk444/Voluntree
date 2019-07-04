import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsRouteUI {
  final Polyline polyline;
  final Marker startMarker;
  final Marker endMarker;

  GoogleMapsRouteUI(this.polyline, this.startMarker, this.endMarker);
}
