import 'dart:io';

import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsDirectionsResponseUI.dart';
import 'package:call_for_code_2019/data/ui/GoogleMapsRouteUI.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/data/ui/ShelterUI.dart';
import 'package:call_for_code_2019/screens/victim_form/nav_controllers/IShelterPickerNavController.dart';
import 'package:call_for_code_2019/screens/victim_form/repositories/ShelterRepository.dart';
import 'package:call_for_code_2019/utils/GoogleMapsUtils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:meta/meta.dart';


class ShelterPickerViewModel {
  final ShelterRepository repository;
  final IShelterPickerNavController navController;

  ShelterPickerViewModel({@required this.repository, @required this.navController});

  void getShelters() async {
    final _markerStream = await repository.getSheltersFromNetwork();
    final shelters = _markerStream.map((poi) => _convertToShelter(from: poi)).toSet();
    navController.onSheltersReceived(shelters);
  }

  ShelterUI _convertToShelter({POIData from}) => ShelterUI(
      id: from.id,
      distance: from.distance,
      address: from.address,
      title: from.description,
      latitude: from.point.latitude,
      longitude: from.point.longitude
  );

  void getRoute({gm.LatLng from, gm.LatLng to}) {
    repository
        .getShelterRoute(from: from, to: to)
        .map((victimDataNet) {
      if (victimDataNet.routes.length > 0)
        return _directionsNetworkDataToUI(victimDataNet.routes[0]);
      else
        return GoogleMapsDirectionsResponseUI([], null);
    }).listen((shelterInfo) {
      navController.onRouteReceived(shelterInfo);
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
              polylineId: gm.PolylineId(route.legs.indexOf(leg).toString()),width: (Platform.isIOS ? 8 : 15),
              points: points),
          null,
          gm.Marker(
            markerId:
            gm.MarkerId("${points.last.latitude}${points.last.longitude}"),
            position: points.last,
            consumeTapEvents: true,
          ));
    }).toList();

    return GoogleMapsDirectionsResponseUI(
        routes,
        route.bounds.toLatLngBounds());
  }
}