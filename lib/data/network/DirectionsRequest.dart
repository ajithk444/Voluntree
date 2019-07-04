import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

const GM_API_KEY = "YOUR_KEY";

class DirectionsRequest {
  LatLng origin;
  LatLng destination;
  List<LatLng> wayPoints;
  List<LatLng> stepOvers;
  TRAVEL_MODE travelMode;
  String apiKey = GM_API_KEY;

  DirectionsRequest({@required this.origin, @required this.destination})
      : assert(origin != null),
        assert(destination != null);
}

enum TRAVEL_MODE { DRIVING, WALKING, BICYCLING, TRANSIT }
