import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:call_for_code_2019/services/Client.dart';
import 'package:call_for_code_2019/services/VictimService/IVictimService.dart';
import 'package:flutter/foundation.dart';

class VictimFormRepository {
  final IVictimService _victimService;

  VictimFormRepository(this._victimService);
  
  Future<Response> uploadVictim(int id, {@required VictimFormDataUI info}) {
    final Map<String, dynamic> infoJson = {
      "id" : info.hashCode,
      "name" : info.name,
      "phoneNumber" : info.phoneNumber,
      "peopleCount" : info.peopleCount,
      "hasDisability" : info.hasDisability,
      "hasKids" : info.hasKids,
      "hasInjuries" : info.hasInjuries,
      "comments" : info.comments,
      "destination" : {
        "address" : info.destinationAddress,
        "latitude" : info.destination.latitude,
        "longitude" : info.destination.longitude
      },
      "currentLocation": {
        "latitude" : info.victimLocation.latitude,
        "longitude" : info.victimLocation.longitude,
      }
    };
    return _victimService.putVictim(id, info: infoJson);
  }
}