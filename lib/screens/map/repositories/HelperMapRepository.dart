import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/services/RouteService/IRouteService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperMapRepository {

  final IRouteService routeService;

  HelperMapRepository(this.routeService);

  Stream<RouteResponse> getNearestVictimFromNetwork(LatLng currentLocation) {
    final request = DirectionsRequest(
      origin: LatLng(35.4675602, -97.5164276),
      destination: LatLng(34.0522342, -118.2436849),
    )..stepOvers = [LatLng(41.8525800, -87.6514100)];

    return routeService.getDirectionsFromGoogleMaps(request).asStream();
  }

}
