import 'package:call_for_code_2019/screens/victim_route_helper_info/pages/IVictimRouteHelperInfoPage.dart';
import 'package:call_for_code_2019/screens/victim_route_helper_info/repositories/VictimRouteHelperRepository.dart';
import 'package:call_for_code_2019/screens/victim_route_helper_info/viewmodels/VictimRouteHelperViewModel.dart';
import 'package:call_for_code_2019/services/RouteService/RouteService.dart';
import 'package:call_for_code_2019/services/ShelterService/ShelterServiceMock.dart';

class VictimRouteHelperInjector {
  // TODO Create a victims service instead of shelters
  static VictimRouteHelperViewModel injectMockViewModel(IVictimRouteHelperInfoPage victimRouteView) {
    return VictimRouteHelperViewModel(
        view: victimRouteView,
        repository: VictimRouteHelperRepository(ShelterServiceMock(), RouteService())
    );
  }
}