import 'dart:async';
import 'dart:convert';

import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/services/RouteService/IRouteService.dart';
import 'package:flutter/services.dart' show rootBundle;

class RouteServiceMock implements IRouteService {

  Future<RouteResponse> _getRouteResponse() async {
    final file = rootBundle
          .loadString("assets/mock_routes_responses/ValladolidMockRoute.json");
    try {
      final jsonResponse = jsonDecode(await file);
      return RouteResponse.fromJson(jsonResponse);
    } catch(e) {
      print(e);
      return null;
    }

//    final mockRouteFiles = [
//      rootBundle
//          .loadString("assets/mock_routes_responses/MockRouteResponse1.json")
//    ];
//    mockRouteFiles.add(rootBundle
//        .loadString("assets/mock_routes_responses/MockRouteResponse2.json"));
//    mockRouteFiles.add(rootBundle
//        .loadString("assets/mock_routes_responses/MockRouteResponse3.json"));
//    mockRouteFiles.add(rootBundle
//        .loadString("assets/mock_routes_responses/MockRouteResponse4.json"));
//    mockRouteFiles.add(rootBundle
//        .loadString("assets/mock_routes_responses/MockRouteResponse5.json"));
//    mockRouteFiles.add(rootBundle
//        .loadString("assets/mock_routes_responses/MockRouteResponse6.json"));
  }

  @override
  Future<RouteResponse> getDirectionsFromGoogleMaps(DirectionsRequest request) {
    return _getRouteResponse();
  }



}
