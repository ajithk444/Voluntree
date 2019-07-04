import 'dart:async';
import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/network/ViewPoint.dart';
import 'package:call_for_code_2019/services/POIService/IPOIService.dart';

class POIServiceMock implements IPOIService {
  final _streamController = StreamController<POIData>();

  final List<POIData> _pois = [
    POIData(id: "1", description: "Marker 1", point: ViewPoint(latitude: 45.531563, longitude:  -122.627433)),
    POIData(id: "2", description: "Marker 2", point: ViewPoint(latitude: 45.491763, longitude:  -122.611433)),
    POIData(id: "3", description: "Marker 3", point: ViewPoint(latitude: 45.541163, longitude:  -122.573433)),
    POIData(id: "4", description: "Marker 4", point: ViewPoint(latitude: 45.512563, longitude:  -122.595433)),
    POIData(id: "5", description: "Marker 5", point: ViewPoint(latitude: 45.531063, longitude:  -122.602433)),
    POIData(id: "6", description: "Marker 6", point: ViewPoint(latitude: 45.401063, longitude:  -122.699433)),
    POIData(id: "7", description: "Marker 7", point: ViewPoint(latitude: 45.491063, longitude:  -122.732433)),
    POIData(id: "8", description: "Marker 8", point: ViewPoint(latitude: 45.421063, longitude:  -122.742433)),
    POIData(id: "9", description: "Marker 9", point: ViewPoint(latitude: 45.411063, longitude:  -122.752433)),
  ];

  @override
  Stream<POIData> getPOIStream() {
    _pois.forEach((poi) => _streamController.sink.add(poi));
    return _streamController.stream;
  }

  @override
  void closeStreamController() {
    _streamController.close();
  }
}