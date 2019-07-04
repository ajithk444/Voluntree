import 'dart:async';
import 'package:call_for_code_2019/data/network/POIData.dart';
import 'package:call_for_code_2019/data/network/ViewPoint.dart';
import 'package:call_for_code_2019/services/ShelterService/IShelterService.dart';

class ShelterServiceMock implements IShelterService {

  final List<POIData> _mockShelters = [
    POIData(id: "1", description: "Pisuerga Refuge", point: ViewPoint(latitude: 41.6581, longitude:  -4.71672), distance: 163, poiType: POIType.shelter, address: "Plza. Mexico S/N"),
    POIData(id: "2", description: "Huerta del Rey", point: ViewPoint(latitude: 41.655763, longitude:  -4.73572), distance: 247, poiType: POIType.shelter, address: "Joaquin Velasco St 9"),
    POIData(id: "3", description: "L.G. Shelter", point: ViewPoint(latitude: 41.6451163, longitude:  -4.72572), distance: 432, poiType: POIType.shelter, address: "Enrique Cubero St 7"),
    POIData(id: "4", description: "Gregorio Fdez.", point: ViewPoint(latitude: 41.652563, longitude:  -4.72672), distance: 894, poiType: POIType.shelter, address: "Guarderia St S/N"),
    POIData(id: "5", description: "Rubia Shelter", point: ViewPoint(latitude: 41.646063, longitude:  -4.722433), distance: 1290, poiType: POIType.shelter, address: "P. Zorrilla 220"),
    POIData(id: "6", description: "F.V. Shelter", point: ViewPoint(latitude: 41.659063, longitude:  -4.729433), distance: 1346, poiType: POIType.shelter, address: "Boedo St 7"),
    POIData(id: "7", description: "Pqsl. Shelter", point: ViewPoint(latitude: 41.659063, longitude:  -4.732433), distance: 1436, poiType: POIType.shelter, address: "Padre Llanos St 1"),
    POIData(id: "8", description: "Gnzl. Berceo", point: ViewPoint(latitude: 41.653063, longitude:  -4.724433), distance: 1694, poiType: POIType.shelter, address: "Mirabel St 23"),
    POIData(id: "9", description: "Pajarillos", point: ViewPoint(latitude: 41.655063, longitude:  -4.732433), distance: 2351, poiType: POIType.shelter, address: "Escribano St 7"),
  ];

  @override
  Future<List<POIData>> getSheltersFromNetwork() => Future.delayed(Duration(seconds: 1), () => _mockShelters);
}