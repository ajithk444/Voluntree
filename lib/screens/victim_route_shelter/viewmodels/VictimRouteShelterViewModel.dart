import 'dart:io';

import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsRouteUI.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/screens/victim_route_shelter/pages/IVictimRouteShelterPage.dart';
import 'package:call_for_code_2019/screens/victim_route_shelter/repositories/VictimRouteShelterRepository.dart';
import 'package:call_for_code_2019/utils/GoogleMapsUtils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:meta/meta.dart';

class VictimRouteShelterViewModel {
  final VictimRouteShelterRepository repository;
  final IVictimRouteShelterPage view;

  VictimRouteShelterViewModel({@required this.repository, @required this.view});

  void getVictims() async {
    final _markerStream = await repository.getVictimsFromNetwork();
    final victims = _markerStream.map((poi) => _convertToVictim(from: poi)).toSet();
    view.onSheltersReceived(victims);
  }

  ShelterUI _convertToVictim({POIData from}) => ShelterUI(
      id: from.id,
      distance: from.distance,
      address: from.address,
      title: from.description,
      latitude: from.point.latitude,
      longitude: from.point.longitude
  );

  void getRoute({gm.LatLng from, gm.LatLng to}) {
    repository
        .getVictimRoute(from: from, to: to)
        .map((victimDataNet) {
      if (victimDataNet.routes.length > 0)
        return _directionsNetworkDataToUI(victimDataNet.routes[0]);
      else
        return GoogleMapsDirectionsResponseUI([], null);
    }).listen((victimInfo) {
      view.onRouteReceived(victimInfo);
    }).onError((e) {
      print(e);
    });
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
              width: (Platform.isIOS ? 8 : 15),
              points: points),
          null,
          gm.Marker(
            consumeTapEvents: true,
            markerId:
            gm.MarkerId("${points.last.latitude}${points.last.longitude}"),
            position: points.last,
          ));
    }).toList();

    return GoogleMapsDirectionsResponseUI(
        routes,
        route.bounds.toLatLngBounds());
  }
}