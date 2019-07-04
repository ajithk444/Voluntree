import 'package:call_for_code_2019/data/network/DirectionsRequest.dart';
import 'package:call_for_code_2019/data/network/RouteResponse.dart';

abstract class IRouteService {
  Future<RouteResponse> getDirectionsFromGoogleMaps(DirectionsRequest request);
}
