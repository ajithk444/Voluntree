import 'package:call_for_code_2019/screens/victim_route_shelter/repositories/VictimRouteShelterRepository.dart';
import 'package:call_for_code_2019/screens/victim_route_shelter/viewmodels/VictimRouteShelterViewModel.dart';
import 'package:call_for_code_2019/services/RouteService/RouteService.dart';
import 'package:call_for_code_2019/services/ShelterService/ShelterServiceMock.dart';

import 'IVictimRouteShelterPage.dart';

class VictimRouteShelterInjector {
  // TODO Create a victims service instead of shelters
  static VictimRouteShelterViewModel injectMockViewModel(IVictimRouteShelterPage victimRouteView) {
    return VictimRouteShelterViewModel(
        view: victimRouteView,
        repository: VictimRouteShelterRepository(ShelterServiceMock(), RouteService())
    );
  }
}