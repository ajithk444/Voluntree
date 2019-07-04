import 'package:call_for_code_2019/data/ui/HelperFormDataUI.dart';
import 'package:call_for_code_2019/services/Client.dart';
import 'package:call_for_code_2019/services/HelperService/IHelperService.dart';
import 'package:flutter/foundation.dart';

class HelperFormRepository {
  final IHelperService _helperService;

  HelperFormRepository(this._helperService);

  Future<Response> uploadHelper(int id, {@required HelperFormDataUI info}) {
    final Map<String, dynamic> infoJson = {
      "id" : info.hashCode,
      "name" : info.name,
      "phoneNumber" : info.phoneNumber,
      "carModel" : info.carModel,
      "comments" : info.comments,
      "capacity" : info.peopleCounter,
      "currentLocation": {
        "address": info.locationAddress,
        "latitude" : info.location.latitude,
        "longitude" : info.location.longitude,
      }
    };
    return _helperService.putHelper(id, info: infoJson);
  }
}