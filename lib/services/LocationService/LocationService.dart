import 'package:call_for_code_2019/services/LocationService/ILocationService.dart';
import 'package:location/location.dart';

class LocationService implements ILocationService {
  final _location = Location();

  @override
  Future<Map<String, double>> getLocation() async {
    return _location.getLocation();
  }
}