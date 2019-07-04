import 'package:call_for_code_2019/data/network/AreaData.dart';

abstract class IAreaService {
  Stream<AreaData> getCircleAreasStream();
  void closeStreamController();
}