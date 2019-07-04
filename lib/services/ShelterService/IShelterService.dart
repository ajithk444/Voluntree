import 'package:call_for_code_2019/data/network/POIData.dart';

abstract class IShelterService {
  Future<List<POIData>> getSheltersFromNetwork();
}