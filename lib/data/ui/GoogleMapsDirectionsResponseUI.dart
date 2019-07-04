import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'GoogleMapsRouteUI.dart';

class GoogleMapsDirectionsResponseUI {
  final List<GoogleMapsRouteUI> routes;
  final LatLngBounds bounds;

  GoogleMapsDirectionsResponseUI(this.routes, this.bounds);


}
