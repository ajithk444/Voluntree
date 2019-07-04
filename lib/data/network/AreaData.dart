import 'package:call_for_code_2019/data/network/ViewPoint.dart';

import 'MapViewport.dart';

class AreaData {
  final String id;
  final String address;
  final String name;
  final String description;
  final AreaGeometry geometry;
  final EventType eventType;
  final int severity;
  final String status;

  AreaData({
    this.id,
    this.address,
    this.name,
    this.description,
    this.geometry,
    this.eventType,
    this.severity,
    this.status
  });

  factory AreaData.fromJson(Map<String, dynamic> parsedJson) => AreaData(
      id: parsedJson['id'].toString(),
      name : parsedJson['address'].toString(),
      description: parsedJson["description"].toString(),
      address: parsedJson["address"].toString(),
      severity: parsedJson['severity'],
      status: parsedJson["status"].toString(),
      geometry: AreaGeometry.fromJson(parsedJson["geometry"]),
  );
}

class AreaGeometry {
  final ViewPoint point;
  final double radius;

  AreaGeometry({this.point, this.radius});

  factory AreaGeometry.fromJson(Map<String, dynamic> parsedJson) => AreaGeometry(
      point: ViewPoint.fromJson(parsedJson["point"]),
      radius: parsedJson["radius"]
  );
}

enum EventType {
  flood, fire, earthquake, tornado, hurricane, avalanche, landslide, volcano
}