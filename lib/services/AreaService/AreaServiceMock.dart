import 'dart:async';

import 'package:call_for_code_2019/data/network/AreaData.dart';
import 'package:call_for_code_2019/data/network/ViewPoint.dart';
import 'package:call_for_code_2019/services/AreaService/IAreaService.dart';

class AreaServiceMock implements IAreaService {
  final _streamController = StreamController<AreaData>();

  final AreaData _bigCircle = AreaData(
      id: "Test area 1",
      description: "River flood",
      geometry: AreaGeometry(
          point: ViewPoint(
            latitude: 41.644633,
            longitude: -4.742228,
          ),
          radius: 700.0));

  final AreaData _valladolidArea = AreaData(
      //41.628633, -4.746228
      id: "Test area valladolid",
      description: "River flood",
      geometry: AreaGeometry(
          point: ViewPoint(latitude: 41.628633, longitude: -4.746228),
          radius: 1000.0));

  @override
  Stream<AreaData> getCircleAreasStream() {
    _streamController.sink.add(_bigCircle);
    _streamController.add(_valladolidArea);
    return _streamController.stream;
  }

  @override
  void closeStreamController() {
    _streamController.close();
  }
}
