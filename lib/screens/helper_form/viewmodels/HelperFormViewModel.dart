import 'package:call_for_code_2019/data/ui/HelperFormDataUI.dart';
import 'package:call_for_code_2019/screens/helper_form/pages/IHelperFormPage.dart';
import 'package:call_for_code_2019/screens/helper_form/repository/HelperFormRepository.dart';

class HelperFormViewModel {
  final IHelperFormPage _view;
  final HelperFormRepository _repository;

  HelperFormViewModel(this._view, this._repository);

  void uploadHelper(HelperFormDataUI info) async {
    await _repository.uploadHelper(info.hashCode, info: info);
    _view.onHelperInfoUploaded();
  }
}