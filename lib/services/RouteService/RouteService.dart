import 'dart:convert';

import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';
import 'package:call_for_code_2019/services/Client.dart';
import 'package:call_for_code_2019/services/apis/DirectionsAPI.dart';

import 'IRouteService.dart';

class RouteService extends IRouteService {
  final client = Client(url: "maps.googleapis.com");

  @override
  Future<RouteResponse> getDirectionsFromGoogleMaps(
      DirectionsRequest request) async {
    final uri = DirectionsAPI.getDirections(client.url, request);

    final response =
        await client.get(uri);

    final responseMap = jsonDecode(response.body);
    return RouteResponse.fromJson(responseMap);
  }
}
