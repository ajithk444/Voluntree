import 'package:call_for_code_2019/screens/victim_form/repositories/VictimFormRepository.dart';
import 'package:call_for_code_2019/screens/victim_form/viewmodels/VictimFormViewModel.dart';
import 'package:call_for_code_2019/services/VictimService/CloudantVictimService.dart';

import 'package:call_for_code_2019/screens/victim_form/pages/IVictimFormPage.dart';

class VictimFormInjector {
  static VictimFormViewModel injectViewModel(IVictimFormPage victimFormNavController) {
    return VictimFormViewModel(victimFormNavController,
        VictimFormRepository(CloudantVictimService())
    );
  }
}