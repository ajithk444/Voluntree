import 'package:call_for_code_2019/data/network/AreaData.dart';
import 'package:call_for_code_2019/screens/map/repositories/MapInfoRepository.dart';
import 'package:call_for_code_2019/screens/map/views/P2PMapDelegate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';

class P2PMapController {
  MapInfoRepository repository;
  P2PMapDelegate mapView;

  void loadAffectedAreas() {
    final _areaStream = repository?.getAreaDataFromNetwork();
    _areaStream.listen((circleArea) {
      final circle = _convertToCircle(from: circleArea);
      mapView?.onCircleReceived(circle);
    }, onError: (error) {
      print(error);
    });
  }

  Circle _convertToCircle({AreaData from}) {
    return Circle(
        circleId: CircleId(from.id),
        center: LatLng(
            from.geometry.point.latitude,
            from.geometry.point.longitude),
        onTap: () => print(from.description),
        radius: from.geometry.radius
    );
  }

  Future<LatLng> getCurrentLocation() async {
    try {
      final currentLocation = await repository?.getLocationFromDevice();
      return LatLng(currentLocation["latitude"], currentLocation["longitude"]);
    } catch (e) {
      print(e);
      return LatLng(0.0, 0.0);
    }
  }

  LatLngBounds getBoundsToFit({Set<Marker> markers}) {
    return LatLngBounds(
      southwest: _getSouthwestCoordinates(forMarkers: markers),
      northeast: _getNortheastCoordinates(forMarkers: markers),
    );
  }

  LatLng _getSouthwestCoordinates({Set<Marker> forMarkers}) {
    final latList = <double>[];
    final lngList = <double>[];
    forMarkers.forEach((marker) => latList.add(marker.position.latitude));
    forMarkers.forEach((marker) => lngList.add(marker.position.longitude));
    final minLat = latList.reduce(min);
    final minLng = lngList.reduce(min);
    return LatLng(minLat, minLng);
  }

  LatLng _getNortheastCoordinates({Set<Marker> forMarkers}) {
    final latList = <double>[];
    final lngList = <double>[];
    forMarkers.forEach((marker) => latList.add(marker.position.latitude));
    forMarkers.forEach((marker) => lngList.add(marker.position.longitude));
    final maxLat = latList.reduce(max);
    final maxLng = lngList.reduce(max);
    return LatLng(maxLat, maxLng);
  }

  void closeMapInfoChannel() {
    repository?.closeMapInfoStreamControllers();
  }
}