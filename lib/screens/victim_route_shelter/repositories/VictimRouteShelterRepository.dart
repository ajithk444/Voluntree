import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';
import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/services/RouteService/IRouteService.dart';
import 'package:call_for_code_2019/services/ShelterService/IShelterService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VictimRouteShelterRepository {
  final IShelterService _shelterService;
  final IRouteService _routeService;

  VictimRouteShelterRepository(this._shelterService, this._routeService);

  Future<List<POIData>> getVictimsFromNetwork() => _shelterService.getSheltersFromNetwork();

  Stream<RouteResponse> getVictimRoute({LatLng from, LatLng to}) {
    final request = DirectionsRequest(origin: from, destination: to);
    return _routeService.getDirectionsFromGoogleMaps(request).asStream();
  }
}