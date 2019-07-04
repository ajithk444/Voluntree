import 'package:call_for_code_2019/data/network/MapViewport.dart';

class ViewPoint {
  final latitude;
  final longitude;
  final MapViewport viewport;

  ViewPoint({this.latitude, this.longitude, this.viewport});

  factory ViewPoint.fromJson(Map<String, dynamic> parsedJson) => ViewPoint(
    longitude: parsedJson["longitude"],
    latitude: parsedJson["latitude"],
    viewport: MapViewport.fromJson(parsedJson["viewport"])
  );
}