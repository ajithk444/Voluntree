import 'package:call_for_code_2019/screens/helper_form/repository/HelperFormRepository.dart';
import 'package:call_for_code_2019/screens/helper_form/viewmodels/HelperFormViewModel.dart';
import 'package:call_for_code_2019/services/HelperService/CloudantHelperService.dart';

import 'IHelperFormPage.dart';

class HelperFormInjector {
  static HelperFormViewModel injectViewModel(IHelperFormPage helperFormPage) =>
      HelperFormViewModel(helperFormPage, HelperFormRepository(CloudantHelperService()));
}