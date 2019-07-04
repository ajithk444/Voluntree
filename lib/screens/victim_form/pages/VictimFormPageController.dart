import 'package:call_for_code_2019/data/ui/VictimFormDataUI.dart';
import 'package:flutter/material.dart';

abstract class VictimFormPageDelegate {
  void onVictimInfo(VictimFormDataUI withInfo);
}

class VictimFormPageController {
  VictimFormPageDelegate _view;

  final TextEditingController destinationAddress = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController comments = TextEditingController();

  VictimFormDataUI getVictimData(VictimFormDataUI withInfo) => VictimFormDataUI(
      name: name.text,
      phoneNumber: phone.text,
      comments: comments.text,
      destination: withInfo.destination,
      destinationAddress: destinationAddress.text,
      hasDisability: withInfo.hasDisability,
      hasInjuries: withInfo.hasInjuries,
      hasKids: withInfo.hasKids,
      peopleCount: withInfo.peopleCount,
      victimLocation: withInfo.victimLocation
  );

  void setVictimFormPage(VictimFormPageDelegate view) => _view = view;

  void uploadData(VictimFormDataUI info) => _view.onVictimInfo(info);
}