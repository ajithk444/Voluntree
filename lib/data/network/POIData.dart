import 'package:call_for_code_2019/data/network/ViewPoint.dart';

class POIData {
  final String id;
  final String address;
  final String description;
  final int distance;
  final ViewPoint point;
  final POIType poiType;
  final String status;

  POIData({
    this.id,
    this.address,
    this.description,
    this.distance,
    this.point,
    this.poiType,
    this.status
  });

  factory POIData.fromJson(Map<String, dynamic> parsedJson) => POIData(
      id: parsedJson["id"].toString(),
      address: parsedJson["address"].toString(),
      description: parsedJson["description"].toString(),
      distance: parsedJson["distance"],
      point: ViewPoint.fromJson(parsedJson["point"]),
      poiType: _mapPOITypeFrom(string: parsedJson["POIType"].toString()),
      status: parsedJson["status"].toString()
  );

  static POIType _mapPOITypeFrom({String string}) {
    switch (string) {
      case "transport":
        return POIType.transport;
        break;
      case "shelter":
        return POIType.shelter;
        break;
      case "supplies":
        return POIType.supplies;
        break;
      case "health":
        return POIType.health;
        break;
      case "hospital":
        return POIType.hospital;
        break;
      case "police":
        return POIType.police;
        break;
      case "firefighter":
        return POIType.firefighter;
        break;
      case "rescue":
        return POIType.rescue;
        break;
      default:
        return POIType.neutral;
        break;
    }
  }
}

enum POIType {
  transport,
  shelter,
  supplies,
  health,
  hospital,
  police,
  firefighter,
  rescue,
  neutral
}