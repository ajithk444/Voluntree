// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RouteResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return RouteResponse(
      geocodedWaypoints: (json['geocoded_waypoints'] as List)
          ?.map((e) => e == null
              ? null
              : GeocodedWaypoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      routes: (json['routes'] as List)
          ?.map((e) =>
              e == null ? null : Route.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      status: json['status'] as String);
}

Map<String, dynamic> _$RouteResponseToJson(RouteResponse instance) =>
    <String, dynamic>{
      'geocoded_waypoints': instance.geocodedWaypoints,
      'routes': instance.routes,
      'status': instance.status
    };

GeocodedWaypoint _$GeocodedWaypointFromJson(Map<String, dynamic> json) {
  return GeocodedWaypoint(
      geocoderStatus: json['geocoder_status'] as String,
      placeId: json['place_id'] as String,
      types: (json['types'] as List)?.map((e) => e as String)?.toList(),
      partialMatch: json['partial_match'] as bool);
}

Map<String, dynamic> _$GeocodedWaypointToJson(GeocodedWaypoint instance) =>
    <String, dynamic>{
      'geocoder_status': instance.geocoderStatus,
      'place_id': instance.placeId,
      'types': instance.types,
      'partial_match': instance.partialMatch
    };

Route _$RouteFromJson(Map<String, dynamic> json) {
  return Route(
      bounds: json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
      copyrights: json['copyrights'] as String,
      legs: (json['legs'] as List)
          ?.map(
              (e) => e == null ? null : Leg.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      overviewPolyline: json['overview_polyline'] == null
          ? null
          : OverviewPolyline.fromJson(
              json['overview_polyline'] as Map<String, dynamic>),
      summary: json['summary'] as String,
      warnings: json['warnings'] as List,
      waypointOrder: json['waypoint_order'] as List);
}

Map<String, dynamic> _$RouteToJson(Route instance) => <String, dynamic>{
      'bounds': instance.bounds,
      'copyrights': instance.copyrights,
      'legs': instance.legs,
      'overview_polyline': instance.overviewPolyline,
      'summary': instance.summary,
      'warnings': instance.warnings,
      'waypoint_order': instance.waypointOrder
    };

Bounds _$BoundsFromJson(Map<String, dynamic> json) {
  return Bounds(
      southwest: json['southwest'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['southwest'] as Map<String, dynamic>),
      northeast: json['northeast'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['northeast'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BoundsToJson(Bounds instance) => <String, dynamic>{
      'southwest': instance.southwest,
      'northeast': instance.northeast
    };

BoundsCoordinates _$BoundsCoordinatesFromJson(Map<String, dynamic> json) {
  return BoundsCoordinates(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$BoundsCoordinatesToJson(BoundsCoordinates instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

Leg _$LegFromJson(Map<String, dynamic> json) {
  return Leg(
      distance: json['distance'] == null
          ? null
          : UnitData.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : UnitData.fromJson(json['duration'] as Map<String, dynamic>),
      endAddress: json['end_address'] as String,
      endLocation: json['end_location'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['end_location'] as Map<String, dynamic>),
      startAddress: json['start_address'] as String,
      startLocation: json['start_location'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['start_location'] as Map<String, dynamic>))
    ..steps = (json['steps'] as List)
        ?.map(
            (e) => e == null ? null : Steps.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..viaWaypoint = (json['via_waypoint'] as List)
        ?.map((e) =>
            e == null ? null : ViaWaypoint.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LegToJson(Leg instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'end_address': instance.endAddress,
      'end_location': instance.endLocation,
      'start_address': instance.startAddress,
      'start_location': instance.startLocation,
      'steps': instance.steps,
      'via_waypoint': instance.viaWaypoint
    };

UnitData _$UnitDataFromJson(Map<String, dynamic> json) {
  return UnitData(text: json['text'] as String, value: json['value'] as int);
}

Map<String, dynamic> _$UnitDataToJson(UnitData instance) =>
    <String, dynamic>{'text': instance.text, 'value': instance.value};

OverviewPolyline _$OverviewPolylineFromJson(Map<String, dynamic> json) {
  return OverviewPolyline(points: json['points'] as String);
}

Map<String, dynamic> _$OverviewPolylineToJson(OverviewPolyline instance) =>
    <String, dynamic>{'points': instance.points};

Steps _$StepsFromJson(Map<String, dynamic> json) {
  return Steps(
      distance: json['distance'] == null
          ? null
          : UnitData.fromJson(json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : UnitData.fromJson(json['duration'] as Map<String, dynamic>),
      endLocation: json['end_location'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['end_location'] as Map<String, dynamic>),
      htmlInstructions: json['html_instructions'] as String,
      polyline: json['polyline'] == null
          ? null
          : Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
      startLocation: json['start_location'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['start_location'] as Map<String, dynamic>))
    ..travel_mode = json['step_index'] as String;
}

Map<String, dynamic> _$StepsToJson(Steps instance) => <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'end_location': instance.endLocation,
      'html_instructions': instance.htmlInstructions,
      'polyline': instance.polyline,
      'start_location': instance.startLocation,
      'step_index': instance.travel_mode
    };

ViaWaypoint _$ViaWaypointFromJson(Map<String, dynamic> json) {
  return ViaWaypoint(
      location: json['location'] == null
          ? null
          : BoundsCoordinates.fromJson(
              json['location'] as Map<String, dynamic>),
      stepIndex: json['step_index'] as int,
      stepInterpolation: (json['step_interpolation'] as num)?.toDouble());
}

Map<String, dynamic> _$ViaWaypointToJson(ViaWaypoint instance) =>
    <String, dynamic>{
      'location': instance.location,
      'step_index': instance.stepIndex,
      'step_interpolation': instance.stepInterpolation
    };

Polyline _$PolylineFromJson(Map<String, dynamic> json) {
  return Polyline(points: json['points'] as String);
}

Map<String, dynamic> _$PolylineToJson(Polyline instance) =>
    <String, dynamic>{'points': instance.points};
