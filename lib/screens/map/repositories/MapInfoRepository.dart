import 'dart:async';

import 'package:call_for_code_2019/data/network/AreaData.dart';
import 'package:call_for_code_2019/services/AreaService/IAreaService.dart';
import 'package:call_for_code_2019/services/LocationService/ILocationService.dart';

class MapInfoRepository {
  final IAreaService _areaService;
  final ILocationService _locationService;

  MapInfoRepository(this._areaService, this._locationService);

  Stream<AreaData> getAreaDataFromNetwork() => _areaService.getCircleAreasStream();
  Future<Map<String, double>> getLocationFromDevice() async => await _locationService.getLocation();

  void closeMapInfoStreamControllers() => _areaService.closeStreamController();
}