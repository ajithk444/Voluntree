import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';
import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/services/RouteService/IRouteService.dart';
import 'package:call_for_code_2019/services/ShelterService/IShelterService.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShelterRepository{
  final IShelterService shelterService;
  final IRouteService routeService;

  ShelterRepository(this.shelterService, this.routeService);

  Future<List<POIData>> getSheltersFromNetwork() => shelterService.getSheltersFromNetwork();
  
  Stream<RouteResponse> getShelterRoute({LatLng from, LatLng to}) {
    final request = DirectionsRequest(origin: from, destination: to);
    return routeService.getDirectionsFromGoogleMaps(request).asStream();
  }
}