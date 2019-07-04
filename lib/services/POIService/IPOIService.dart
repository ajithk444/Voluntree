import 'package:call_for_code_2019/data/network/POIData.dart';

abstract class IPOIService {
  Stream<POIData> getPOIStream();
  void closeStreamController();
}