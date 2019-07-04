import 'package:call_for_code_2019/screens/map/repositories/MapInfoRepository.dart';
import 'package:call_for_code_2019/services/AreaService/AreaServiceMock.dart';
import 'package:call_for_code_2019/services/AreaService/CloudantAreaService.dart';
import 'package:call_for_code_2019/services/LocationService/LocationService.dart';

class MapInjector {

  static MapInfoRepository injectMockRepository() => MapInfoRepository(AreaServiceMock(), LocationService());

  static MapInfoRepository injectRepository() => MapInfoRepository(CloudantAreaService(), LocationService());
}
