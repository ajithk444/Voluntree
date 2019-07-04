import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:call_for_code_2019/screens/victim_form/pages/IVictimFormPage.dart';
import 'package:call_for_code_2019/screens/victim_form/repositories/VictimFormRepository.dart';

class VictimFormViewModel {
  final IVictimFormPage _view;
  final VictimFormRepository _repository;
  
  VictimFormViewModel(this._view, this._repository);

  void uploadVictim(VictimFormDataUI info) async {
    await _repository.uploadVictim(info.hashCode, info: info);
    _view.onVictimInfoUploaded();
  }
}
