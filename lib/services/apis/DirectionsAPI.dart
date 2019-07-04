import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';

class DirectionsAPI {
  static String _getDirectionsEndpoint() => "maps/api/directions/json";

  static Uri getDirections(String baseUrl, DirectionsRequest request) {
    final Map<String, String> params = Map<String, String>();

    params["key"] = request.apiKey;

    params["origin"] = "${request.origin.latitude},${request.origin.longitude}";
    params["destination"] =
        "${request.destination.latitude},${request.destination.longitude}";

    String wayPoints = "";

    if (request.wayPoints != null && request.wayPoints.length > 0) {
      request.wayPoints.forEach((wayPoint) {
        if (request.wayPoints.indexOf(wayPoint) != 0) wayPoints += "|";
        wayPoints += "via:${wayPoint.latitude},${wayPoint.longitude}";
      });
    }

    if (request.stepOvers != null && request.stepOvers.length > 0) {
      request.stepOvers.forEach((stepOver) {
        if (request.stepOvers.indexOf(stepOver) != 0) wayPoints += "|";
        wayPoints += "${stepOver.latitude},${stepOver.longitude}";
      });
    }

    if (wayPoints.isNotEmpty) params["waypoints"] = wayPoints;

    return Uri.https(baseUrl, _getDirectionsEndpoint(), params);
  }
}
