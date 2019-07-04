import 'package:call_for_code_2019/screens/map/repositories/HelperMapRepository.dart';
import 'package:call_for_code_2019/screens/map/viewmodels/HelperMapViewModel.dart';
import 'package:call_for_code_2019/services/RouteService/RouteService.dart';
import 'package:call_for_code_2019/services/RouteService/RouteServiceMock.dart';

import '../IHelperMapViewPage.dart';

class HelperMapInjector {
  static HelperMapViewModel injectViewModel(IHelperMapViewPage view) =>
  HelperMapViewModel(
    HelperMapRepository(RouteService()),
    view
  );

  static HelperMapViewModel injectMockViewModel(IHelperMapViewPage view) =>
      HelperMapViewModel(
          HelperMapRepository(RouteServiceMock()),
          view);
}
