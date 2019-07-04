// To parse this JSON data, do
//
//     final routeResponse = routeResponseFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RouteResponse.g.dart';

RouteResponse routeResponseFromJson(String str) =>
    RouteResponse.fromJson(json.decode(str));

String routeResponseToJson(RouteResponse data) => json.encode(data.toJson());

@JsonSerializable()
class RouteResponse {
  @JsonKey(name: "geocoded_waypoints")
  List<GeocodedWaypoint> geocodedWaypoints;
  List<Route> routes;
  String status;

  RouteResponse({
    this.geocodedWaypoints,
    this.routes,
    this.status,
  });

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);

//      new RouteResponse(
//    geocodedWaypoints: new List<GeocodedWaypoint>.from(json["geocoded_waypoints"]?.map((x) => GeocodedWaypoint.fromJson(x))),
//    routes: new List<Route>.from(json["routes"]?.map((x) => Route.fromJson(x))),
//    status: json["status"],
//  );

  Map<String, dynamic> toJson() => _$RouteResponseToJson(this);
//      {
//    "geocoded_waypoints": new List<dynamic>.from(geocodedWaypoints?.map((x) => x.toJson())),
//    "routes": new List<dynamic>.from(routes?.map((x) => x.toJson())),
//    "status": status,
//  };
}

@JsonSerializable()
class GeocodedWaypoint {
  @JsonKey(name: "geocoder_status")
  String geocoderStatus;
  @JsonKey(name: "place_id")
  String placeId;
  List<String> types;
  @JsonKey(name: "partial_match")
  bool partialMatch;

  GeocodedWaypoint({
    this.geocoderStatus,
    this.placeId,
    this.types,
    this.partialMatch,
  });

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) =>
      _$GeocodedWaypointFromJson(json);

//      new GeocodedWaypoint(
//    geocoderStatus: json["geocoder_status"],
//    placeId: json["place_id"],
//    types: new List<String>.from(json["types"]?.map((x) => x)),
//    partialMatch: json["partial_match"] == null ? null : json["partial_match"],
//  );

  Map<String, dynamic> toJson() => _$GeocodedWaypointToJson(this);
//      {
//    "geocoder_status": geocoderStatus,
//    "place_id": placeId,
//    "types": new List<dynamic>.from(types?.map((x) => x)),
//    "partial_match": partialMatch == null ? null : partialMatch,
//  };
}

@JsonSerializable()
class Route {
  Bounds bounds;
  String copyrights;
  List<Leg> legs;
  @JsonKey(name: "overview_polyline")
  OverviewPolyline overviewPolyline;
  String summary;
  List<dynamic> warnings;
  @JsonKey(name: "waypoint_order")
  List<dynamic> waypointOrder;

  Route({
    this.bounds,
    this.copyrights,
    this.legs,
    this.overviewPolyline,
    this.summary,
    this.warnings,
    this.waypointOrder,
  });

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);

//      new Route(
//    bounds: Bounds.fromJson(json["bounds"]),
//    copyrights: json["copyrights"],
//    legs: new List<Leg>.from(json["legs"]?.map((x) => Leg.fromJson(x))),
//    overviewPolyline: OverviewPolyline.fromJson(json["overview_polyline"]),
//    summary: json["summary"],
//    warnings: new List<dynamic>.from(json["warnings"]?.map((x) => x)),
//    waypointOrder: new List<dynamic>.from(json["waypoint_order"]?.map((x) => x)),
//  );

  Map<String, dynamic> toJson() => _$RouteToJson(this);
//      {
//    "bounds": bounds.toJson(),
//    "copyrights": copyrights,
//    "legs": new List<dynamic>.from(legs?.map((x) => x.toJson())),
//    "overview_polyline": overviewPolyline.toJson(),
//    "summary": summary,
//    "warnings": new List<dynamic>.from(warnings?.map((x) => x)),
//    "waypoint_order": new List<dynamic>.from(waypointOrder?.map((x) => x)),
//  };
}

@JsonSerializable()
class Bounds {
  BoundsCoordinates southwest;
  BoundsCoordinates northeast;

  Bounds({
    this.southwest,
    this.northeast,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);

  Map<String, dynamic> toJson() => _$BoundsToJson(this);

  LatLngBounds toLatLngBounds() =>
      LatLngBounds(
        southwest: southwest.toLatLng(),
        northeast: northeast.toLatLng()
      );
}

@JsonSerializable()
class BoundsCoordinates {
  double lat;
  double lng;

  BoundsCoordinates({
    this.lat,
    this.lng,
  });

  factory BoundsCoordinates.fromJson(Map<String, dynamic> json) =>
      _$BoundsCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$BoundsCoordinatesToJson(this);

  LatLng toLatLng() => LatLng(lat, lng);
}

@JsonSerializable()
class Leg {
  UnitData distance;
  UnitData duration;
  @JsonKey(name: "end_address")
  String endAddress;
  @JsonKey(name: "end_location")
  BoundsCoordinates endLocation;
  @JsonKey(name: "start_address")
  String startAddress;
  @JsonKey(name: "start_location")
  BoundsCoordinates startLocation;
  List<Steps> steps;
  @JsonKey(name: "via_waypoint")
  List<ViaWaypoint> viaWaypoint;

  Leg({
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
    this.viaWaypoint
  });

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);

//      new Leg(
//    distance: TravelCostResponse.fromJson(json["distance"]),
//    duration: TravelCostResponse.fromJson(json["duration"]),
//    endAddress: json["end_address"],
//    endLocation: BoundsCoordinates.fromJson(json["end_location"]),
//    startAddress: json["start_address"],
//    startLocation: BoundsCoordinates.fromJson(json["start_location"]),
//  );

  Map<String, dynamic> toJson() => _$LegToJson(this);
//      {
//    "distance": distance.toJson(),
//    "duration": duration.toJson(),
//    "end_address": endAddress,
//    "end_location": endLocation.ToJson(this),
//    "start_address": startAddress,
//    "start_location": startLocation.toJson(),
//  };
}

@JsonSerializable()
class UnitData {
  String text;
  int value;

  UnitData({
    this.text,
    this.value,
  });

  factory UnitData.fromJson(Map<String, dynamic> json) =>
      _$UnitDataFromJson(json);

//      new TravelCostResponse(
//    text: json["text"],
//    value: json["value"],
//  );

  Map<String, dynamic> toJson() => _$UnitDataToJson(this);
//      {
//    "text": text,
//    "value": value,
//  };
}

@JsonSerializable()
class OverviewPolyline {
  String points;

  OverviewPolyline({
    this.points,
  });

  factory OverviewPolyline.fromJson(Map<String, dynamic> json) =>
      _$OverviewPolylineFromJson(json);

//      new OverviewPolyline(
//    points: json["points"],
//  );

  Map<String, dynamic> toJson() => _$OverviewPolylineToJson(this);

//      {
//    "points": points,
//  };
}

@JsonSerializable()
class Steps {
  UnitData distance;
  UnitData duration;
  @JsonKey(name: "end_location")
  BoundsCoordinates endLocation;
  @JsonKey(name: "html_instructions")
  String htmlInstructions;
  Polyline polyline;
  @JsonKey(name: "start_location")
  BoundsCoordinates startLocation;
  @JsonKey(name: "step_index")
  String travel_mode;

  Steps(
      {this.distance,
        this.duration,
        this.endLocation,
        this.htmlInstructions,
        this.polyline,
        this.startLocation,
        this.travel_mode});

  factory Steps.fromJson(Map<String, dynamic> json) => _$StepsFromJson(json);

  Map<String, dynamic> toJson() => _$StepsToJson(this);
}

@JsonSerializable()
class ViaWaypoint {
  BoundsCoordinates location;
  @JsonKey(name: "step_index")
  int stepIndex;
  @JsonKey(name: "step_interpolation")
  double stepInterpolation;

  ViaWaypoint({this.location, this.stepIndex, this.stepInterpolation});

  factory ViaWaypoint.fromJson(Map<String, dynamic> json) => _$ViaWaypointFromJson(json);

  Map<String, dynamic> toJson() => _$ViaWaypointToJson(this);
}

@JsonSerializable()
class Polyline {
  String points;

  Polyline({this.points});

  factory Polyline.fromJson(Map<String, dynamic> json) => _$PolylineFromJson(json);

  Map<String, dynamic> toJson() => _$PolylineToJson(this);
}
