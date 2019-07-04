import 'package:call_for_code_2019/screens/victim_form/nav_controllers/IShelterPickerNavController.dart';
import 'package:call_for_code_2019/screens/victim_form/repositories/ShelterRepository.dart';
import 'package:call_for_code_2019/screens/victim_form/viewmodels/ShelterPickerViewModel.dart';
import 'package:call_for_code_2019/services/RouteService/RouteService.dart';
import 'package:call_for_code_2019/services/ShelterService/CloudantShelterService.dart';
import 'package:call_for_code_2019/services/ShelterService/ShelterServiceMock.dart';

class ShelterInjector {
  static ShelterPickerViewModel injectMockViewModel(IShelterPickerNavController shelterPickerView) {
    return ShelterPickerViewModel(
        navController: shelterPickerView,
        repository: ShelterRepository(ShelterServiceMock(), RouteService())
    );
  }

  static ShelterPickerViewModel injectViewModel(IShelterPickerNavController shelterPickerView) {
    return ShelterPickerViewModel(
        navController: shelterPickerView,
        repository: ShelterRepository(CloudantShelterService(), RouteService())
    );
  }
}