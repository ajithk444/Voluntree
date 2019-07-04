import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/network/MapViewport.dart';

class RouteData {
  final String id;
  final TravelModeType travelMode;
  final TravelCost duration;
  final TravelCost durationInTraffic;
  final TravelCost distance;
  final POIData startPOI;
  final POIData endPOI;
  final String encodedPoints;
  final MapViewport viewport;
  final String status;

  RouteData({
    this.id,
    this.travelMode,
    this.duration,
    this.durationInTraffic,
    this.distance,
    this.startPOI,
    this.endPOI,
    this.encodedPoints,
    this.viewport,
    this.status
  });
}

class TravelCost {
  final int value;
  final String text;

  TravelCost({this.value, this.text});
}

enum TravelModeType {
  driving, walking, bicycling
}