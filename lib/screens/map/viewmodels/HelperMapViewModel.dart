import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsRouteUI.dart';
import 'package:call_for_code_2019/screens/map/repositories/HelperMapRepository.dart';
import 'package:call_for_code_2019/screens/map/views/IHelperMapViewPage.dart';
import 'package:call_for_code_2019/utils/GoogleMapsUtils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class HelperMapViewModel {
  final HelperMapRepository helperMapRepository;
  final IHelperMapViewPage helperMapViewPage;

  HelperMapViewModel(this.helperMapRepository, this.helperMapViewPage)
      : assert(helperMapRepository != null);

  void getNearVictims(gm.LatLng currentLocation) {
    helperMapRepository
        .getNearestVictimFromNetwork(currentLocation)
        .map((victimDataNet) {
      if (victimDataNet.routes.length > 0)
        return _directionsNetworkDataToUI(victimDataNet.routes[0]);
      else
        return GoogleMapsDirectionsResponseUI([], null);
    }).listen((victimInfo) {
      helperMapViewPage.onRouteReceived(victimInfo);
    }).onError((e) {
      print("Helper route error: $e");
    });
  }
}

GoogleMapsDirectionsResponseUI _directionsNetworkDataToUI(Route route) {
  final List<GoogleMapsRouteUI> routes = route.legs.map((leg) {
    final List<gm.LatLng> points = [];

    leg.steps.forEach((step) {
      points.addAll(GoogleMapsUtils.decodePolyline(step.polyline.points));
    });

    return GoogleMapsRouteUI(
        gm.Polyline(
            polylineId: gm.PolylineId(route.legs.indexOf(leg).toString()),
            points: points),
        null,
        gm.Marker(
          consumeTapEvents: true,
          onTap: null,
          markerId:
              gm.MarkerId("${points.last.latitude}${points.last.longitude}"),
          position: points.last,
        ));
  }).toList();

  return GoogleMapsDirectionsResponseUI(
      routes,
      route.bounds.toLatLngBounds());
}
